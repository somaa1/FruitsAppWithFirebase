
import '../entities/review_entity.dart';
import '../model/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
