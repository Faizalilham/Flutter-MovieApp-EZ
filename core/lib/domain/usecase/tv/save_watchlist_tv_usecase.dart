import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv_detail.dart';
import 'package:core/domain/repository/tv_repository.dart';

class SaveWatchlistTvUsecase {
  TvRepository tvRepository;

  SaveWatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, String>> execute(TvDetail tvDetail) {
    return tvRepository.saveWatchlistTv(tvDetail);
  }
}
