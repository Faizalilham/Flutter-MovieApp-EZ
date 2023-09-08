import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:core/domain/entitites/tv/tv.dart';
import 'package:core/domain/repository/tv_repository.dart';

class RecommendedTvUsecase {
  TvRepository tvRepository;

  RecommendedTvUsecase(this.tvRepository);

  Future<Either<Failure, List<Tv>>> execute(id) {
    return tvRepository.getRecommendationsTv(id);
  }
}
