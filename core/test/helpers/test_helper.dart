


import 'package:core/utils/network.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:core/data/datasource/helper/movie_database_helper.dart';
import 'package:core/data/datasource/helper/shared_preference_helper.dart';
import 'package:core/data/datasource/helper/tv_database_helper.dart';
import 'package:core/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:core/data/datasource/local/tv/local_data_source_tv.dart';
import 'package:core/data/datasource/remote/remote_data_source.dart';
import 'package:core/domain/repository/movie_repository.dart';
import 'package:core/domain/repository/tv_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvRepository,
  RemoteDataSource,
  LocalDataSourceTv,
  LocalDataSourceMovie,
  TvDatabaseHelper,
  MovieDatabaseHelper,
  Network,
  SharedPreferencesHelper
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])


void main(){

}
