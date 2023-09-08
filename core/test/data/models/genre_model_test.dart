


import 'package:core/data/models/movie/genre_model.dart';
import 'package:core/domain/entitites/movie/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final genreModel = GenreModel(
      id: 1,
      name: 'name'
  );
  final genre = Genre(
      id: 1,
      name: 'name'
  );


  test('should be a subclass of genre entity', () async {
    final result = genreModel.toEntity();
    expect(result, genre);
  });

}