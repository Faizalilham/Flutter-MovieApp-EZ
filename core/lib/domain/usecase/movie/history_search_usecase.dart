import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/repository/movie_repository.dart';

class HistorySearchUsecase {
  MovieRepository movieRepository;
  HistorySearchUsecase(this.movieRepository);

  Future<Either<Failure, String>> executeSave(List<String> data) =>
      movieRepository.saveHistorySearch(data);

  Future<Either<Failure, List<String>>> executeGet() =>
      movieRepository.getHistorySearch();

  Future<Either<Failure, String>> executeRemove() =>
      movieRepository.removeHistorySearch();
}
