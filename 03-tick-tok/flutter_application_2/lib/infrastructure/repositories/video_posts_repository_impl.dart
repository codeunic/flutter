import 'package:flutter_application_2/domain/datasource/video_posts_datasource.dart';
import 'package:flutter_application_2/domain/entities/video_post.dart';
import 'package:flutter_application_2/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostsDatasource videosDatasource;

  VideoPostsRepositoryImpl({
    required this.videosDatasource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    return videosDatasource.getFavoriteVideosByUser(userID);
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
