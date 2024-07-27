class Post {
  final String id;
  final String imageUrl;
  final String author;
  final String countryOfOrigin;
  final String taste;
  final String aroma;
  final String location;
  final String comment;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.imageUrl,
    required this.author,
    required this.countryOfOrigin,
    required this.taste,
    required this.aroma,
    required this.location,
    required this.comment,
    required this.timestamp,
  });
}
