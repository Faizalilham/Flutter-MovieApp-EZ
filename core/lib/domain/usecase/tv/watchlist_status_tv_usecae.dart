
import 'package:core/domain/repository/tv_repository.dart';

class WatchlistStatusTvUsecase {
  TvRepository tvRepository;

  WatchlistStatusTvUsecase(this.tvRepository);

  Future<bool> execute(int id) async {
    return tvRepository.isAddedToWatchlistTv(id);
  }
}
