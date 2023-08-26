import 'package:dartz/dartz.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

class WatchlistTvUsecase {
  TvRepository tvRepository;

  WatchlistTvUsecase(this.tvRepository);

  Future<Either<Failure, List<Tv>>> execute() {
    return tvRepository.getWatchlistTv();
  }
}
