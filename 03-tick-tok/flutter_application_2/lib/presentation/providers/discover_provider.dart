import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/video_post.dart';
import 'package:flutter_application_2/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostRepository,
  });

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
