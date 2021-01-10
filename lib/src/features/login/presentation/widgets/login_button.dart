import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color splashColor;
  final textColor;
  final highlightColor;
  final fillColor;

  const LoginButton(
      {Key key,
      @required this.text,
      @required this.textColor,
      @required this.splashColor,
      @required this.fillColor,
      @required this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
