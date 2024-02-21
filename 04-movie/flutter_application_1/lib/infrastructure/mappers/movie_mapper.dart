import 'package:flutter_application_1/domain/entities/movie.dart';
import 'package:flutter_application_1/infrastructure/models/moviedb/moviedb_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) {
    return Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
          : 'https://imgs.search.brave.com/kqqZInEmAQzfWinqMAIO6l4ykBtqLpmAWtCuH0IRvuw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hczEu/ZnRjZG4ubmV0L3Yy/L2pwZy8wMS8wMy84/OC8xNC81MDBfRl8x/MDM4ODE0ODFfWlZN/WFJMWEtVWTFheXZL/dWZNdmd4bHphdVQ1/YjFtU1EuanBn',
      genreIds: movie.genreIds.map((e) => e.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
          : 'no-poster',
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
