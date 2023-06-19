import 'evaluation.dart';
import 'package:social_eval/pages/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MYval {
  final String id;
  final String name;
  final String? imageUrl;
  final Evaluation evaluation;
  final String? text;
  MYval(this.id, this.name, this.evaluation, this.imageUrl, this.text);
}

final oldReviewsProvider = Provider<List<MYval>>((ref) => []);

List<MYval> oldReviews = [];
