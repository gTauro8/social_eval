import 'package:flutter/material.dart';

import '../theme/theme.dart';

class UIConstants {
  static AppBar appBarWithText(String text) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Widget buildListTile(String labelText, Text value) {
    return ListTile(
      title: Text(labelText),
      subtitle: value,
    );
  }

  Widget buildListTileWithIcon(String label, Icon icon) {
    return ListTile(
      title: Text(label),
      trailing: icon,
    );
  }

  Widget buildCheckboxListTile(String labelText, bool? value) {
    return CheckboxListTile(
      title: Text(labelText),
      value: value ?? false,
      onChanged: null,
    );
  }
}
