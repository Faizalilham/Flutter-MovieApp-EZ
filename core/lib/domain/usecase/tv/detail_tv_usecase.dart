import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv_detail.dart';
import 'package:core/domain/repository/tv_repository.dart';

class DetailTvUsecase {
  TvRepository tvRepository;

  DetailTvUsecase(this.tvRepository);

  Future<Either<Failure, TvDetail>> execute(int id) {
    return tvRepository.getDetailTv(id);
  }
}
