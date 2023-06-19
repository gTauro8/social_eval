import 'package:flutter/material.dart';
import 'package:social_eval/model/user.dart';
import 'package:social_eval/utiliy/constantrs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/palette.dart';
import 'home_view.dart';

class Profilo extends StatefulWidget {
  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  User user = users[2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(16.0),
                  child: Card(
                    color: Palette.senaryColor,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: user.imageUrl != null
                                  ? Image.network(
                                      user.imageUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.person, size: 70.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Courtesy: ${user.evaluation.courtesy}',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.thumb_up,
                                        color: Colors.green),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Kindness ${user.evaluation.kindness}',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.schedule,
                                        color: Colors.blue),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Reliability: ${user.evaluation.reliability}',
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
