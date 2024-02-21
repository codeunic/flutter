class VideoPost {
  final String caption;
  final String videourl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videourl,
    this.likes = 0,
    this.views = 0,
  });
}
