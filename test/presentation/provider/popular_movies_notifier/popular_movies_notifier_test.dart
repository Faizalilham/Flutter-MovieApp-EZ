


import 'package:movie_app/common/failure.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/popular_movie_usecase.dart';
import 'package:movie_app/presentation/provider/movie/popular_movie_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../movie_list/movie_list_notifier_test.mocks.dart';

@GenerateMocks([
  PopularMovieUsecase
])
void main(){
  late MockGetPopularMovies mockGetPopularMovies;
  late PopularMoviesNotifier notifier;
  late int listenerCallCount;

  setUp((){
    listenerCallCount = 0;
    mockGetPopularMovies = MockGetPopularMovies();
    notifier = PopularMoviesNotifier(mockGetPopularMovies)..addListener(() {
      listenerCallCount++;
    });
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovieList = <Movie>[tMovie];


  test('should change state to loading when usecase is called', () async {
    ///arrange
    when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(tMovieList));
    ///act
    notifier.fetchPopularMovies();
    ///assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    ///arrange
    when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(tMovieList));
    ///act
    await notifier.fetchPopularMovies();
    ///assert
    expect(notifier.state, RequestState.Success);
    expect(notifier.movies, tMovieList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    ///arrange
    when(mockGetPopularMovies.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    ///act
    await notifier.fetchPopularMovies();
    ///assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });

}