import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/constants/environment.dart';
import 'package:flutter_application_1/domain/datasources/movies_datasource.dart';
import 'package:flutter_application_1/domain/entities/movie.dart';
import 'package:flutter_application_1/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_application_1/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDatasourceImpl extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-ES',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return movies;
  }
}
