import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie_detail.dart';
import 'package:core/domain/repository/movie_repository.dart';

class SaveWatchlistUsecase {
  MovieRepository movieRepository;

  SaveWatchlistUsecase(this.movieRepository);

  Future<Either<Failure, String>> execute(MovieDetail movie) => movieRepository.saveWatchlist(movie);
}
