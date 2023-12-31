// Mocks generated by Mockito 5.1.0 from annotations
// in app_clean_architecture_flutter/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i25;
import 'dart:typed_data' as _i26;

import 'package:movie_app/common/failure.dart' as _i8;
import 'package:movie_app/common/network.dart'
    as _i24;
import 'package:movie_app/data/datasource/helper/movie_database_helper.dart'
    as _i23;
import 'package:movie_app/data/datasource/helper/tv_database_helper.dart'
    as _i21;
import 'package:movie_app/data/datasource/local/movie/local_data_source_movie.dart'
    as _i19;
import 'package:movie_app/data/datasource/local/tv/local_data_source_tv.dart'
    as _i17;
import 'package:movie_app/data/datasource/remote/remote_data_source.dart'
    as _i14;
import 'package:movie_app/data/models/movie/movie_detail_model.dart'
    as _i3;
import 'package:movie_app/data/models//movie/movie_model.dart'
    as _i15;
import 'package:movie_app/data/models/movie/movie_table.dart'
    as _i20;
import 'package:movie_app/data/models/tv/tv_detail_model.dart'
    as _i4;
import 'package:movie_app/data/models/tv/tv_model.dart'
    as _i16;
import 'package:movie_app/data/models/tv/tv_table.dart'
    as _i18;
import 'package:movie_app/domain/entitites/movie/movie.dart'
    as _i9;
import 'package:movie_app/domain/entitites/movie/movie_detail.dart'
    as _i10;
import 'package:movie_app/domain/entitites/tv/tv.dart'
    as _i13;
import 'package:movie_app/domain/entitites/tv/tv_detail.dart'
    as _i12;
import 'package:movie_app/domain/repository/movie_repository.dart'
    as _i6;
import 'package:movie_app/domain/repository/tv_repository.dart'
    as _i11;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i22;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailModel_1 extends _i1.Fake implements _i3.MovieDetailModel {
}

class _FakeTvDetailModel_2 extends _i1.Fake implements _i4.TvDetailModel {}

class _FakeResponse_3 extends _i1.Fake implements _i5.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i5.StreamedResponse {
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getNowPlaying() =>
      (super.noSuchMethod(Invocation.method(#getNowPlaying, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>> getDetailMovie(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailMovie, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>.value(
              _FakeEither_0<_i8.Failure, _i10.MovieDetail>())) as _i7
          .Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
              _FakeEither_0<_i8.Failure, List<_i9.Movie>>())) as _i7
          .Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i11.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i12.TvDetail>> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
              returnValue: Future<_i2.Either<_i8.Failure, _i12.TvDetail>>.value(
                  _FakeEither_0<_i8.Failure, _i12.TvDetail>()))
          as _i7.Future<_i2.Either<_i8.Failure, _i12.TvDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getTvOnTheAir() =>
      (super.noSuchMethod(Invocation.method(#getTvOnTheAir, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getTvTopRated() =>
      (super.noSuchMethod(Invocation.method(#getTvTopRated, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getTvPopular() =>
      (super.noSuchMethod(Invocation.method(#getTvPopular, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getRecommendationsTv(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationsTv, [id]),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlistTv(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tvDetail]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlistTv(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tvDetail]),
              returnValue: Future<_i2.Either<_i8.Failure, String>>.value(
                  _FakeEither_0<_i8.Failure, String>()))
          as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>.value(
                  _FakeEither_0<_i8.Failure, List<_i13.Tv>>()))
          as _i7.Future<_i2.Either<_i8.Failure, List<_i13.Tv>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i14.RemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i15.MovieModel>> getNowPlaying() => (super.noSuchMethod(
          Invocation.method(#getNowPlaying, []),
          returnValue: Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]))
      as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]))
      as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]))
      as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]))
          as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i16.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]))
          as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i16.TvModel>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
  @override
  _i7.Future<_i3.MovieDetailModel> getDetailMovie(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailMovie, [id]),
              returnValue:
                  Future<_i3.MovieDetailModel>.value(_FakeMovieDetailModel_1()))
          as _i7.Future<_i3.MovieDetailModel>);
  @override
  _i7.Future<_i4.TvDetailModel> getDetailTv(int? id) => (super.noSuchMethod(
          Invocation.method(#getDetailTv, [id]),
          returnValue: Future<_i4.TvDetailModel>.value(_FakeTvDetailModel_2()))
      as _i7.Future<_i4.TvDetailModel>);
  @override
  _i7.Future<List<_i16.TvModel>> getTvAiringToday() =>
      (super.noSuchMethod(Invocation.method(#getTvAiringToday, []),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
  @override
  _i7.Future<List<_i16.TvModel>> getTvOnTheAir() =>
      (super.noSuchMethod(Invocation.method(#getTvOnTheAir, []),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
  @override
  _i7.Future<List<_i16.TvModel>> getTvTopRated() =>
      (super.noSuchMethod(Invocation.method(#getTvTopRated, []),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
  @override
  _i7.Future<List<_i16.TvModel>> getTvPopular() =>
      (super.noSuchMethod(Invocation.method(#getTvPopular, []),
              returnValue: Future<List<_i16.TvModel>>.value(<_i16.TvModel>[]))
          as _i7.Future<List<_i16.TvModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i17.LocalDataSourceTv {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlistTv(_i18.TvTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tvTable]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlistTv(_i18.TvTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tvTable]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i18.TvTable?> getTvById(int? id) => (super.noSuchMethod(
      Invocation.method(#getTvById, [id]),
      returnValue: Future<_i18.TvTable?>.value()) as _i7.Future<_i18.TvTable?>);
  @override
  _i7.Future<List<_i18.TvTable>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<_i18.TvTable>>.value(<_i18.TvTable>[]))
          as _i7.Future<List<_i18.TvTable>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i19.LocalDataSourceMovie {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i20.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i20.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i20.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i20.MovieTable?>.value())
          as _i7.Future<_i20.MovieTable?>);
  @override
  _i7.Future<List<_i20.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i20.MovieTable>>.value(<_i20.MovieTable>[]))
      as _i7.Future<List<_i20.MovieTable>>);
  @override
  _i7.Future<void> cacheNowPlayingMovies(List<_i20.MovieTable>? movies) =>
      (super.noSuchMethod(Invocation.method(#cacheNowPlayingMovies, [movies]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<_i20.MovieTable>> getCacheNowPlaying() => (super.noSuchMethod(
          Invocation.method(#getCacheNowPlaying, []),
          returnValue: Future<List<_i20.MovieTable>>.value(<_i20.MovieTable>[]))
      as _i7.Future<List<_i20.MovieTable>>);
}

/// A class which mocks [DatabaseHelperTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTv extends _i1.Mock implements _i21.TvDatabaseHelper {
  MockDatabaseHelperTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i22.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i22.Database?>.value())
          as _i7.Future<_i22.Database?>);
  @override
  _i7.Future<void> insertCacheTransaction(
          List<_i18.TvTable>? tvTable, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransaction, [tvTable, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getCacheTv(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheTv, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<int> clearCache(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCache, [category]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> insertWatchlistTv(_i18.TvTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tvTable]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchList(_i18.TvTable? tvTable) =>
      (super.noSuchMethod(Invocation.method(#removeWatchList, [tvTable]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i23.MovieDatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i22.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i22.Database?>.value())
          as _i7.Future<_i22.Database?>);
  @override
  _i7.Future<void> insertCacheTransaction(
          List<_i20.MovieTable>? movies, String? category) =>
      (super.noSuchMethod(
          Invocation.method(#insertCacheTransaction, [movies, category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getCacheMovies(String? category) =>
      (super.noSuchMethod(Invocation.method(#getCacheMovies, [category]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
  @override
  _i7.Future<int> clearCache(String? category) =>
      (super.noSuchMethod(Invocation.method(#clearCache, [category]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> insertWatchlist(_i20.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i20.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i24.Network {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i26.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i26.Uint8List>.value(_i26.Uint8List(0)))
          as _i7.Future<_i26.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
