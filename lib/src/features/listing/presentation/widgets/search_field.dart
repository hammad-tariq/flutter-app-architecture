import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/theme.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          // TODO: implement callback.
        },
        style: titleStyle,
        decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            fillColor: splashColor,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
