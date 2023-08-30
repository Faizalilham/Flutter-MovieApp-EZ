import 'package:flutter/material.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/history_search_usecase.dart';
import 'package:movie_app/domain/usecase/movie/search_movie_usecase.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final SearchMovieUsecase searchMovies;
  final HistorySearchUsecase historySearchUsecase;
  MovieSearchNotifier(
      {required this.searchMovies, required this.historySearchUsecase});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _searchResult = [];
  List<Movie> get searchResult => _searchResult;

  List<String> _historySearchResult = [];
  List<String> get historySearchResult => _historySearchResult;

  String _message = '';
  String get message => _message;

  bool _isHistory = true;
  bool get isHistory => _isHistory;

  void showHistory() {
    _isHistory = !_isHistory;
    notifyListeners();
  }

  Future<void> fetchMovieSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies.execute(query);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (data) {
      _searchResult = data;
      _state = RequestState.Success;
      notifyListeners();
    });
  }

  Future<void> fetchHistorySearch() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await historySearchUsecase.executeGet();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
    }, (data) {
      _historySearchResult = data;
      _state = RequestState.Success;
    });
  }

  Future<void> saveHistorySearch(List<String> data) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await historySearchUsecase.executeSave(data);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
    }, (data) {
      _message = data;
      _state = RequestState.Success;
    });
  }

  Future<void> removeHistorySearch() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await historySearchUsecase.executeRemove();
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
    }, (data) {
      _message = data;
      _state = RequestState.Success;
    });
  }
}
