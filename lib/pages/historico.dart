import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_eval/main.dart';
import 'package:social_eval/model/myval.dart';
import 'package:social_eval/model/user.dart';

import '../theme/theme.dart';
import '../utiliy/constantrs.dart';

class Historico extends StatefulWidget {
  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  AppBar appBar = UIConstants.appBarWithText('Social Eval');
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final oldReviews = ref.watch(oldReviewsProvider);
          child:
          return SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.4, // Altezza definita
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: PageView.builder(
                      itemCount: oldReviews.length,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        MYval oldR = oldReviews[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            margin: const EdgeInsets.all(8.0),
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: oldR.imageUrl != null
                                            ? Image.network(
                                                oldR.imageUrl!,
                                                fit: BoxFit.cover,
                                              )
                                            : const Icon(Icons.person,
                                                size: 70.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            oldR.name,
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
                                                'Courtesy: ${oldR.evaluation.courtesy}',
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.thumb_up,
                                                  color: Colors.green),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                'Kindness: ${oldR.evaluation.kindness}',
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.schedule,
                                                  color: Colors.blue),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                'Reliability: ${oldR.evaluation.reliability}',
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
