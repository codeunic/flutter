import 'package:flutter_application_1/domain/repositories/movies_repository.dart';
import 'package:flutter_application_1/infrastructure/datasources/moviedb_datasource_impl.dart';
import 'package:flutter_application_1/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(MovieDbDatasourceImpl());
});
