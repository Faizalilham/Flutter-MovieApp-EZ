import 'package:movie_app/data/models/movie/movie_table.dart';

abstract class LocalDataSourceMovie{

  Future<String> insertWatchlist(MovieTable movie);
  Future<String> removeWatchlist(MovieTable movie);
  Future<MovieTable?> getMovieById(int id);
  Future<List<MovieTable>> getWatchlistMovies();
  Future<void> cacheNowPlayingMovies(List<MovieTable> movies);
  Future<List<MovieTable>> getCacheNowPlaying();

  Future<String> saveHistorySearch(List<String> data);
  Future<List<String>> getHistorySearch();
  Future<String> removeHistorySearch();
  

}