import 'package:developine_app/core/layout/colored_safearea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../core/util/theme.dart';
import '../widgets/header_menu_widget.dart';
import '../widgets/search_field_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: kPaddingS, left: kPaddingS, right: kPaddingS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderMenuWidget(),
              SizedBox(
                height: kSpaceS,
              ),
              Text(
                'We will deliver in 30 minutes',
                style: subTitle2,
              ),
              SizedBox(
                height: kSpaceM,
              ),
              SearchFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
