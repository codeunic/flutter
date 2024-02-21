import 'package:flutter_application_2/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) {
    return LocalVideoModel(
      name: json['name'],
      videoUrl: json['videoUrl'],
      likes: json['likes'],
      views: json['views'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'videoUrl': videoUrl,
      'likes': likes,
      'views': views,
    };
  }

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videourl: videoUrl,
        likes: likes,
        views: views,
      );
}
