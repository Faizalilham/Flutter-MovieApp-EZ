import 'dart:io';

import 'package:movie_app/common/exception.dart';
import 'package:movie_app/common/network.dart';
import 'package:movie_app/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:movie_app/data/datasource/remote/remote_data_source.dart';
import 'package:movie_app/data/models/movie/movie_table.dart';
import 'package:movie_app/domain/entitites/movie/movie_detail.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSourceMovie localDataSource;
  final Network network;

  const MovieRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.network});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    if (await network.isConnected) {
      try {
        final result = await remoteDataSource.getNowPlaying();
        localDataSource.cacheNowPlayingMovies(
            result.map((movie) => MovieTable.fromDTO(movie)).toList());
        print("$result yyy");
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return Left(ServerFailure(''));
      } on SocketException {
        return Left(ConnectionFailure('Failed to connect network!'));
      }
    } else {
      try {
        final result = await localDataSource.getCacheNowPlaying();
        return Right(result.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetailMovie(int id) async {
    try {
      final result = await remoteDataSource.getDetailMovie(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed connect to network!'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id) async {
    try {
      final result = await remoteDataSource.getMovieRecommendations(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed connect to network'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failure to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await remoteDataSource.searchMovies(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failure to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getWatchlistMovies() async {
    final result = await localDataSource.getWatchlistMovies();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getMovieById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(MovieDetail movie) async {
    try {
      final result =
          await localDataSource.removeWatchlist(MovieTable.fromEntity(movie));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(MovieDetail movie) async {
    try {
      final result =
          await localDataSource.insertWatchlist(MovieTable.fromEntity(movie));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await remoteDataSource.getTopRatedMovies();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
