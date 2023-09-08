import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/movie/movie.dart';
import 'package:core/domain/repository/movie_repository.dart';

class SearchMovieUsecase {
  MovieRepository movieRepository;

  SearchMovieUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute(String movie) => movieRepository.searchMovies(movie);
}