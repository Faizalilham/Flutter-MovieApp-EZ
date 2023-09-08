import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv_detail.dart';
import 'package:core/domain/repository/tv_repository.dart';

class RemoveWatchlistTvUsecase {
  TvRepository tvRepository;

  RemoveWatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, String>> execute(TvDetail tvDetail) {
    return tvRepository.removeWatchlistTv(tvDetail);
  }
}
