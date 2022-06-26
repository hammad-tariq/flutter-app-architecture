import 'package:developine_app/core/layout/colored_safearea.dart';
import 'package:flutter/material.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
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
                  style: caption,
                ),
                SizedBox(
                  height: kSpaceM,
                ),
                SearchFieldWidget(),
              ],
            ),
          ),
        ),
      ),
      color: Colors.transparent,
      showBanner: false,
    );
  }
}
