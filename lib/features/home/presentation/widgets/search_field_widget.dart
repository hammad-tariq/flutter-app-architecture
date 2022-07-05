import 'dart:developer';
import 'package:developine_app/core/const/route_constants.dart';
import 'package:developine_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/util/theme.dart';

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextField(
        decoration: kTextFieldDecoration,
        enabled: false,
      ),
      onTap: () {
        log("Search Icon tap.");
        RouteNavigator.pushNamed(routeName: RoutesList.searchRoute);
      },
    );
  }
}
