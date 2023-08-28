import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class SharedPreferenceUseCase {
  MovieRepository movieRepository;
  SharedPreferenceUseCase(this.movieRepository);

  Future<Either<Failure, String>> executeSave(List<String> data) =>
      movieRepository.saveHistorySearch(data);

  Future<Either<Failure, List<String>>> executeGet() =>
      movieRepository.getHistorySearch();

  Future<Either<Failure, String>> executeRemove() =>
      movieRepository.removeHistorySearch();
}
