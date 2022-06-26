import 'dart:developer';
import 'package:developine_app/core/const/route_constants.dart';
import 'package:developine_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.search),
        ),
      ),
      onTap: () {
        log("Search Icon tap.");
        RouteNavigator.pushNamed(routeName: RoutesList.searchRoute);
      },
    );
  }
}
