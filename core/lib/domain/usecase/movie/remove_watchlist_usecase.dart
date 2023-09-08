import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie_detail.dart';
import 'package:core/domain/repository/movie_repository.dart';

class RemoveWatchlistUsecase {
  MovieRepository movieRepository;

  RemoveWatchlistUsecase(this.movieRepository);

  Future<Either<Failure, String>> execute(MovieDetail movie) =>
      movieRepository.removeWatchlist(movie);
}
