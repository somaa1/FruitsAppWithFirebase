class ReviewEntity {
  final String name;
  final String image;
  final num rating;
  final num data;
  final String reviewDescription;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.rating,
      required this.data,
      required this.reviewDescription});
}
