import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie.dart';
import 'package:core/domain/repository/movie_repository.dart';

class RecommendedMovieUsecase {
  MovieRepository movieRepository;

  RecommendedMovieUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute(int id) =>
      movieRepository.getMovieRecommendations(id);
}