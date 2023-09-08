import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie.dart';
import 'package:core/domain/repository/movie_repository.dart';

class WatchlistMovieUsecase {
  MovieRepository movieRepository;

  WatchlistMovieUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute() =>
      movieRepository.getWatchlistMovies();
}
