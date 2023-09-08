
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/state.dart';
import 'package:search/presentation/provider/tv_search_notifier.dart';
import 'package:core/presentation/widgets/card_tv.dart';
import 'package:provider/provider.dart';

class SearchTvPage extends StatefulWidget {
  static const routeName = '/search_tv';
  const SearchTvPage({Key? key}) : super(key: key);

  @override
  State<SearchTvPage> createState() => _SearchTvPageState();
}

class _SearchTvPageState extends State<SearchTvPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search TV"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (query) {
                Provider.of<TvSearchNotifier>(context, listen: false)
                    .fetchTvSearch(query);
              },
              autofocus: true,
              textInputAction: TextInputAction.search,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'What do you want to watch?',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: kRichBlack,
                ),
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Text('Search Result', style: Heading6,),
            Consumer<TvSearchNotifier>(
              builder: (context, data, child){
                if(data.state == RequestState.Loading){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(data.state == RequestState.Success){
                  final result = data.searchResultTv;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index){
                        final movie = data.searchResultTv[index];
                        return CardTvList(movie);
                      },
                    ),
                  );
                }else{
                  return Expanded(child: Container());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
