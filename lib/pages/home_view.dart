import 'package:flutter/material.dart';
import 'package:social_eval/model/user.dart';
import 'package:social_eval/pages/historico.dart';
import 'package:social_eval/pages/user.dart';
import 'package:social_eval/theme/theme.dart';
import 'package:social_eval/utiliy/constantrs.dart';
import 'package:social_eval/pages/profilo.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppBar appBar = UIConstants.appBarWithText('Social Eval');
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const Text(
            'Nearly users',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: PageView.builder(
                itemCount: users.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  User user = users[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRatingView(user: user),
                        ),
                      );
                    },
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
                                          'Kindness: ${user.evaluation.kindness}',
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
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Historico(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Larghezza della card
                    height: 125, // Altezza della card
                    margin: const EdgeInsets.all(8.0),
                    child: const Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                          child: ListTile(
                        leading: Icon(Icons.restore, size: 30),
                        title:
                            Text('Old Reviews', style: TextStyle(fontSize: 20)),
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profilo(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Larghezza della card
                    height: 125, // Altezza della card
                    margin: const EdgeInsets.all(8.0),
                    child: const Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                          child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        title: Text('Profile', style: TextStyle(fontSize: 20)),
                      )),
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
