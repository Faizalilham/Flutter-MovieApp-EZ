import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie_detail.dart';
import 'package:core/domain/repository/movie_repository.dart';

class DetailMovieUsecase {
  MovieRepository movieRepository;

  DetailMovieUsecase(this.movieRepository);

  Future<Either<Failure, MovieDetail>> execute(int id) =>
      movieRepository.getDetailMovie(id);
}
