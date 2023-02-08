class Post{
  final String id;
  final String title;
  final String body;
  final String userId;
  final String? image;
  final String? profileImage;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    this.image,
    this.profileImage,
  });

}