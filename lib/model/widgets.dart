import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@override
commento({required String userPost, required ValueChanged<String> onPressed}) {
  final textController = TextEditingController();
  return Column(
    children: [
      Center(
        child: Text(userPost, style: TextStyle(fontSize: 35)),
      ),
      TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'inserisci il commento su questo utente',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                textController.clear();
              },
              icon: Icon(Icons.clear)),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Fluttertoast.showToast(msg: 'testo salvato!');
          userPost = textController.text;
        },
        color: Colors.blue,
        child: const Text(
          'Salva',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
