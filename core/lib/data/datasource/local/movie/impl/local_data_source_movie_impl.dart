

import 'package:core/data/datasource/helper/movie_database_helper.dart';
import 'package:core/data/datasource/helper/shared_preference_helper.dart';
import 'package:core/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:core/data/models/movie/movie_table.dart';
import 'package:core/utils/exception.dart';

class LocalDataSourceMovieImpl implements LocalDataSourceMovie {
  final MovieDatabaseHelper movieDbHelper;

  final SharedPreferencesHelper sharedPreferencesHelper;

  LocalDataSourceMovieImpl(
      {required this.movieDbHelper, required this.sharedPreferencesHelper});

  @override
  Future<String> insertWatchlist(MovieTable movie) async {
    try {
      await movieDbHelper.insertWatchlist(movie);
      return 'Added to watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(MovieTable movie) async {
    try {
      await movieDbHelper.removeWatchlist(movie);
      return 'Removed from watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await movieDbHelper.getMovieById(id);
    if (result != null) {
      return MovieTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getWatchlistMovies() async {
    final result = await movieDbHelper.getWatchlistMovies();
    return result.map((data) => MovieTable.fromMap(data)).toList();
  }

  @override
  Future<List<MovieTable>> getCacheNowPlaying() async {
    final result = await movieDbHelper.getCacheMovies('now playing');
    if (result.length > 0) {
      return result.map((data) => MovieTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :( ");
    }
  }

  @override
  Future<void> cacheNowPlayingMovies(List<MovieTable> movies) async {
    await movieDbHelper.clearCache('now playing');
    await movieDbHelper.insertCacheTransaction(movies, 'now playing');
  }

  @override
  Future<List<String>> getHistorySearch() async {
    return  await sharedPreferencesHelper.getHistorySearch();
  }

  @override
  Future<String> removeHistorySearch() async{
     try {
      await sharedPreferencesHelper.removeHistorySearch();
      return 'Removed';
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String> saveHistorySearch(List<String> data)async {
    try {
      await sharedPreferencesHelper.saveHistorySearch(data);
      return 'Saved';
    } catch (e) {
      throw Exception();
    }
  }
}
