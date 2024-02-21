import 'package:flutter_application_2/domain/datasource/video_posts_datasource.dart';
import 'package:flutter_application_2/domain/entities/video_post.dart';
import 'package:flutter_application_2/infrastructure/models/local_video_model.dart';
import 'package:flutter_application_2/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
