import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entitites/movie/movie.dart';
import 'package:core/domain/repository/movie_repository.dart';

class NowPlayingUsecase {
  MovieRepository movieRepository;

  NowPlayingUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute() =>
      movieRepository.getNowPlaying();
}
