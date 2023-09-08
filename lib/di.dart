import 'package:core/data/datasource/helper/movie_database_helper.dart';
import 'package:core/data/datasource/helper/shared_preference_helper.dart';
import 'package:core/data/datasource/helper/tv_database_helper.dart';
import 'package:core/data/datasource/local/movie/impl/local_data_source_movie_impl.dart';
import 'package:core/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:core/data/datasource/local/tv/impl/local_data_source_tv_impl.dart';
import 'package:core/data/datasource/local/tv/local_data_source_tv.dart';
import 'package:core/data/datasource/remote/impl/remote_data_source_impl.dart';
import 'package:core/data/datasource/remote/remote_data_source.dart';
import 'package:core/data/repository/movie_repository_impl.dart';
import 'package:core/data/repository/tv_repository_impl.dart';
import 'package:core/domain/repository/movie_repository.dart';
import 'package:core/domain/repository/tv_repository.dart';
import 'package:core/domain/usecase/movie/detail_movie_usecase.dart';
import 'package:core/domain/usecase/movie/history_search_usecase.dart';
import 'package:core/domain/usecase/movie/now_playing_usecase.dart';
import 'package:core/domain/usecase/movie/popular_movie_usecase.dart';
import 'package:core/domain/usecase/movie/recommended_movie_usecase.dart';
import 'package:core/domain/usecase/movie/remove_watchlist_usecase.dart';
import 'package:core/domain/usecase/movie/save_watchlist_usecase.dart';
import 'package:search/domain/usecase/search_movie_usecase.dart';
import 'package:core/domain/usecase/movie/top_rated_movie_usecase.dart';
import 'package:core/domain/usecase/movie/watchlist_movie_status_usecase.dart';
import 'package:core/domain/usecase/movie/watchlist_movie_usecase.dart';
import 'package:core/domain/usecase/tv/airing_today_usecase.dart';
import 'package:core/domain/usecase/tv/detail_tv_usecase.dart';
import 'package:core/domain/usecase/tv/onair_tv_usecase.dart';
import 'package:core/domain/usecase/tv/popular_tv_usecase.dart';
import 'package:core/domain/usecase/tv/recommended_tv_usecase.dart';
import 'package:core/domain/usecase/tv/remove_watchlist_tv_usecase.dart';
import 'package:core/domain/usecase/tv/save_watchlist_tv)usecase.dart';
import 'package:search/domain/usecase/search_tv_usecase.dart';
import 'package:core/domain/usecase/tv/top_rated_tv_usecase.dart';
import 'package:core/domain/usecase/tv/watchlist_status_tv_usecae.dart';
import 'package:core/domain/usecase/tv/watchlist_tv_usecase.dart';
import 'package:core/presentation/provider/movie/detail_movie_notifier.dart';
import 'package:core/presentation/provider/movie/list_movie_notifier.dart';
import 'package:core/presentation/provider/movie/popular_movie_notifier.dart';
import 'package:search/presentation/provider/search_movie_notifier.dart';
import 'package:core/presentation/provider/movie/top_rated_movie_notifier.dart';
import 'package:core/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/tv/tv_airing_today_notifier.dart';
import 'package:core/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:core/presentation/provider/tv/tv_list_notifier.dart';
import 'package:core/presentation/provider/tv/tv_on_the_air_notifier.dart';
import 'package:core/presentation/provider/tv/tv_popular_notifier.dart';
import 'package:search/presentation/provider/tv_search_notifier.dart';
import 'package:core/presentation/provider/tv/watchlist_tv_notifier.dart';
import 'package:core/utils/network.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;

void init() {
  ///provider movies
  locator.registerFactory(() => MovieListNotifier(
        nowPlayingUsecase: locator(),
        popularMovieUsecase: locator(),
        topRatedMovieUsecase: locator(),
      ));

     

  ///provider tv
  locator.registerFactory(() => TvListNotifier(
        onAirTvUsecase: locator(),
        airingTvUsecase: locator(),
        popularTvUsecase: locator(),
        topRatedTvUsecase: locator(),
      ));

  locator.registerFactory(() => TvDetailNotifier(
        detailTvUsecase: locator(),
        watchlistStatusTvUsecase: locator(),
        saveWatchlistTvUsecase: locator(),
        removeWatchlistTvUsecase: locator(),
        recommendedTvUsecase: locator(),
      ));


  locator.registerFactory(() => MovieDetailNotifier(
        detailMovieUsecase: locator(),
        recommendedMovieUsecase: locator(),
        watchlistMovieUsecase: locator(),
        saveWatchlist: locator(),
        removeWatchlist: locator(),
      ));

  ///
  locator.registerFactory(() => MovieSearchNotifier(searchMovies: locator(),historySearchUsecase: locator()));
  locator.registerFactory(() => TvSearchNotifier( searchTvUsecase: locator()));
  

  //
  locator.registerFactory(() => PopularMoviesNotifier(locator()));
  locator.registerFactory(
      () => TopRatedMoviesNotifier(topRatedMovieUsecase: locator()));

  ///
  locator.registerFactory(
      () => WatchlistMovieNotifier(watchlistMovieUsecase: locator()));
  locator.registerFactory(() => WatchlistTvNotifier(watchlistTvUsecase: locator()));

  ///
  locator.registerFactory(() => TvOnTheAirNotifier(onAirTvUsecase: locator()));
  locator.registerFactory(
      () => TvAiringTodayNotifier(airingTvUsecase: locator()));
  locator.registerFactory(() => TvPopularNotifier(locator()));

  ///use case movie
  locator.registerLazySingleton(() => NowPlayingUsecase(locator()));
  locator.registerLazySingleton(() => PopularMovieUsecase(locator()));
  locator.registerLazySingleton(() => TopRatedMovieUsecase(locator()));
  locator.registerLazySingleton(() => DetailMovieUsecase(locator()));
  locator.registerLazySingleton(() => RecommendedMovieUsecase(locator()));

  ///
  locator.registerFactory(() => SharedPreferencesHelper());
  locator.registerLazySingleton(() => SearchMovieUsecase(locator()));
  locator.registerLazySingleton(() => HistorySearchUsecase(locator()));
  locator.registerLazySingleton(() => SearchTvUsecase(locator()));

  ///use case tv
  locator.registerLazySingleton(() => AiringTvUsecase(locator()));
  locator.registerLazySingleton(() => OnAirTvUsecase(locator()));
  locator.registerLazySingleton(() => DetailTvUsecase(locator()));
  locator.registerLazySingleton(() => PopularTvUsecase(locator()));
  locator.registerLazySingleton(() => TopRatedTvUsecase(locator()));
  locator.registerLazySingleton(() => RecommendedTvUsecase(locator()));

  ///watchlist tv
  locator.registerLazySingleton(() => WatchlistStatusTvUsecase(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvUsecase(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvUsecase(locator()));
  locator.registerLazySingleton(() => WatchlistTvUsecase(locator()));

  ///watchlist movie
  locator.registerLazySingleton(() => WatchlistMovieUsecase(locator()));
  locator.registerLazySingleton(() => SaveWatchlistUsecase(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistUsecase(locator()));
  locator.registerLazySingleton(() => WatchlistMovieStatusUsecase(locator()));

  ///repository movie
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        network: locator(),
      ));

  ///repository tv
  locator.registerLazySingleton<TvRepository>(() => TvRepositoryImpl(
        remoteDataSource: locator(),
        tvLocalDataSource: locator(),
        networkInfo: locator(),
      ));
 
  ///data source
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<LocalDataSourceMovie>(
      () => LocalDataSourceMovieImpl(movieDbHelper: locator(),sharedPreferencesHelper: locator()));
  locator.registerLazySingleton<LocalDataSourceTv>(
      () => LocalDataSourceTvImpl(tvDatabaseHelper: locator()));

  ///helper
  locator.registerLazySingleton<MovieDatabaseHelper>(() => MovieDatabaseHelper());
  locator.registerLazySingleton<TvDatabaseHelper>(() => TvDatabaseHelper());

  ///network
  locator.registerLazySingleton<Network>(() => NetworkInfoImpl(locator()));

  ///external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
