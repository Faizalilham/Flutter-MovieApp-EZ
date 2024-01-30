import 'package:core/utils/failure.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv.dart';
import 'package:core/domain/repository/tv_repository.dart';

class SearchTvUsecase {
  TvRepository tvRepository;

  SearchTvUsecase(this.tvRepository);

  Future<Either<Failure, List<Tv>>> execute(String query) {
    return tvRepository.searchTv(query);
  }
}
