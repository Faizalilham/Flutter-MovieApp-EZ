




import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/common/failure.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/popular_tv_usecase.dart';
import 'package:movie_app/presentation/provider/tv/tv_popular_notifier.dart';

import 'tv_popular_notifier_test.mocks.dart';

@GenerateMocks([
  PopularTvUsecase
])
void main(){
  late MockGetTvPopular mockGetTvPopular;
  late TvPopularNotifier notifier;
  late int listenerCallCount;

  setUp((){
    listenerCallCount = 0;
    mockGetTvPopular = MockGetTvPopular();
    notifier = TvPopularNotifier(mockGetTvPopular)..addListener(() {
      listenerCallCount++;
    });
  });

  final testTv = Tv(
      backdropPath: "backdropPath",
      genreIds: [1,2,3],
      id: 1,
      name: "name",
      originalLanguage: "es",
      originalName: "originalName",
      overview: "overview",
      popularity: 1,
      posterPath: "posterPath",
      voteAverage: 1,
      voteCount: 1
  );
  final tvList = <Tv>[testTv];

  test('should change state to loading when usecase is called', () async {
    ///arrange
    when(mockGetTvPopular.execute()).thenAnswer((_) async => Right(tvList));
    ///act
    notifier.fetchTvPopular();
    ///assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    ///arrange
    when(mockGetTvPopular.execute()).thenAnswer((_) async => Right(tvList));
    ///act
    await notifier.fetchTvPopular();
    ///assert
    expect(notifier.state, RequestState.Success);
    expect(notifier.popularTv, tvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    ///arrange
    when(mockGetTvPopular.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    ///act
    await notifier.fetchTvPopular();
    ///assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}