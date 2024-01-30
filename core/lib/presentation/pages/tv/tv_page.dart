import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constant.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/state.dart';
import 'package:core/domain/entitites/tv/tv.dart';
import 'package:core/presentation/pages/shimmer.dart';
import 'package:core/presentation/pages/tv/airing_today_page.dart';
import 'package:core/presentation/pages/tv/popular_tv_page.dart';
import 'package:core/presentation/pages/tv/tv_detail_page.dart';
import 'package:core/presentation/pages/tv/tv_on_the_air_page.dart';
import 'package:core/presentation/provider/tv/tv_list_notifier.dart';
import 'package:provider/provider.dart';

class TvPage extends StatefulWidget {
  static const routeName = '/tv_home';

  const TvPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TvPageState createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvListNotifier>(context, listen: false)
      ..fetchAiringTodayTv()
      ..fetchOnTheAirTv()
      ..fetchPopularTv()
      ..fetchTopRatedTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: const Icon(Icons.search),
              onTap: () {
                Navigator.pushNamed(context, SEARCH_ROUTE);
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tv Top Rated',
                style: Heading6,
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.topRatedTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv Popular',
                  onTap: () {
                    Navigator.pushNamed(context, PopularTvPage.routeName);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.popularTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv On The Air',
                  onTap: () {
                    Navigator.pushNamed(context, TvOnTheAirPage.routeName);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.onTheAirTvState;
                  if (state == RequestState.Loading) {
                    return showShimmer();
                  } else if (state == RequestState.Success) {
                    return TvList(data.onTheAirTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Tv Airing Today',
                  onTap: () {
                    Navigator.pushNamed(context, AiringTodayPage.routeName);
                  }),
              Consumer<TvListNotifier>(builder: (context, data, child) {
                final state = data.airingTodayState;
                if (state == RequestState.Loading) {
                  return showShimmer();
                } else if (state == RequestState.Success) {
                  return TvList(data.airingTodayTv);
                } else {
                  return Text(data.message);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Heading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [Text('See more'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        )
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tv;

  const TvList(this.tv, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tv.length,
        itemBuilder: (context, index) {
          final movieTv = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                debugPrint('${movieTv.id}');
                Navigator.pushNamed(context, TvDetailPage.routeName,
                    arguments: movieTv.id);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movieTv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: showShimmer(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
