import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_eval/model/evaluation.dart';
import 'package:social_eval/model/user.dart';
import 'package:social_eval/utiliy/constantrs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_eval/model/widgets.dart';
import '../model/myval.dart';
import '../theme/palette.dart';
import 'home_view.dart';

class UserRatingView extends StatefulWidget {
  final User user;
  UserRatingView({required this.user});

  @override
  State<UserRatingView> createState() => _UserRatingViewState();
}

class _UserRatingViewState extends State<UserRatingView> {
  int courtesyRating = 0;
  int kindnessRating = 0;
  int reliabilityRating = 0;
  String userPost = '';
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Rating'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final oldReviews = ref.watch(oldReviewsProvider);
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User: ${widget.user.name}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Courtesy:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      _buildStarRatingBar(
                        rating: courtesyRating,
                        onChanged: (rating) {
                          setState(() {
                            courtesyRating = rating;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Kindness:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      _buildStarRatingBar(
                        rating: kindnessRating,
                        onChanged: (rating) {
                          setState(() {
                            kindnessRating = rating;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Reliability:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      _buildStarRatingBar(
                        rating: reliabilityRating,
                        onChanged: (rating) {
                          setState(() {
                            reliabilityRating = rating;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Text('Spazio per il commento' + userPost),
                      commento(
                          userPost: userPost,
                          onPressed: (userPost) {
                            setState(() {
                              userPost = userPost;
                            });
                          }),
                      Text('Spazio per il commento' + userPost),
                      const SizedBox(
                        height: 24.0,
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          MYval newUser = MYval(
                              widget.user.id,
                              widget.user.name,
                              Evaluation(courtesyRating, kindnessRating,
                                  reliabilityRating),
                              widget.user.imageUrl,
                              userPost);
                          ref.watch(oldReviewsProvider).add(newUser);
                          print(oldReviews.length);
                          await Fluttertoast.showToast(
                            msg: 'Thank you for your rating!' + userPost,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.grey[700],
                            textColor: Colors.white,
                            fontSize: 30.0,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStarRatingBar(
      {required int rating, required ValueChanged<int> onChanged}) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            onChanged(index + 1);
          },
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
        );
      }),
    );
  }
}
