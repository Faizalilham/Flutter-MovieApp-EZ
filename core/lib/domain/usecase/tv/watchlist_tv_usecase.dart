import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv.dart';
import 'package:core/domain/repository/tv_repository.dart';

class WatchlistTvUsecase {
  TvRepository tvRepository;

  WatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, List<Tv>>> execute() {
    return tvRepository.getWatchlistTv();
  }
}