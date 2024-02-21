import 'package:flutter_application_1/domain/datasources/movies_datasource.dart';
import 'package:flutter_application_1/domain/entities/movie.dart';
import 'package:flutter_application_1/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource movieDatasource;

  MovieRepositoryImpl(this.movieDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return movieDatasource.getNowPlaying(page: page);
  }
}
