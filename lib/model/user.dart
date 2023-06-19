import 'evaluation.dart';

class User {
  final String id;
  final String name;
  final String? imageUrl;
  final Evaluation evaluation;

  User(this.id, this.name, this.evaluation, this.imageUrl);
}

List<User> users = [
  User(
    '1',
    'Peppeo',
    Evaluation(3, 3, 3),
    null,
  ),
  User(
    '2',
    'Alice',
    Evaluation(4, 5, 4),
    null,
  ),
  User(
    '3',
    'IO',
    Evaluation(5, 4, 5),
    null,
  ),
  User(
    '4',
    'Elena',
    Evaluation(3, 2, 4),
    null,
  ),
  User(
    '5',
    'Marco',
    Evaluation(5, 5, 5),
    null,
  ),
  User(
    '6',
    'Sophia',
    Evaluation(4, 4, 4),
    null,
  ),
];
