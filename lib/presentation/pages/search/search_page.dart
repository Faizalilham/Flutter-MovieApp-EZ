import 'package:flutter/material.dart';
import 'package:movie_app/common/constant.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/presentation/provider/movie/search_movie_notifier.dart';
import 'package:movie_app/presentation/widgets/card_movie.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MovieSearchNotifier>(context, listen: false)
          ..showHistory()
          ..fetchHistorySearch());
    print(
        "${Provider.of<MovieSearchNotifier>(context, listen: false).isHistory}");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: textFieldController,
              onFieldSubmitted: (value) {
                searchs(context, value);
              },
              onChanged: (query) {}, // untuk live search wa
              onTap: () async {
                Provider.of<MovieSearchNotifier>(context, listen: false)
                    .showHistory();
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
                suffixIcon: InkWell(
                    onTap: () {
                      textFieldController.clear();
                      Provider.of<MovieSearchNotifier>(context, listen: false)
                          .showHistory();
                    },
                    child: const Icon(Icons.close_rounded, color: kRichBlack)),
                contentPadding: const EdgeInsets.all(15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer<MovieSearchNotifier>(builder: (context, data, child) {
              final result = data.searchResult;
              final tapResult = data.isHistory;

              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Success) {
                print("${data.historySearchResult.length} oyoyoy");
                return tapResult
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: data.historySearchResult.length,
                          itemBuilder: (context, index) {
                            
                            final search =
                                data.historySearchResult.toList()[index];
                            return Column(
                              children: [
                                Text(
                                  tapResult ? 'History Result' : 'Search Result',
                                  style: Heading6,
                                ),
                                const SizedBox(height: 20),
                                data.historySearchResult.isNotEmpty
                                ? ListTile(
                                    leading: Image.asset("assets/img/clock.png",
                                        height: 15, width: 15),
                                    contentPadding: const EdgeInsets.all(4),
                                    title: InkWell(
                                      onTap: () {
                                        textFieldController.text = search;
                                        searchs(context, search);
                                      },
                                      child: Text(search, style: subtitle),
                                    ),
                                    trailing: InkWell(
                                      onTap: () async {
                                        var datas = data.historySearchResult;
                                        datas.remove(search);
                                        Provider.of<MovieSearchNotifier>(
                                                context,
                                                listen: false)
                                            .saveHistorySearch(datas.toList());
                                      },
                                      child: const Icon(Icons.close,
                                          color: Colors.white),
                                    ),
                                  )
                                : Container()
                              ],
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: result.length,
                          itemBuilder: (context, index) {
                            final movie = data.searchResult[index];
                            return CardList(movie);
                          },
                        ),
                      );
              } else {
                return Expanded(child: Container());
              }
            })
          ],
        ),
      ),
    );
  }
}

void searchs(BuildContext context, String query) {
  var listSearch = Provider.of<MovieSearchNotifier>(context, listen: false)
      .historySearchResult;

  listSearch.add(query);

  Provider.of<MovieSearchNotifier>(context, listen: false)
    ..showHistory()
    ..fetchMovieSearch(query)
    ..saveHistorySearch(listSearch.toList());
}
