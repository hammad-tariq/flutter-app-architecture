import 'package:developine_app/core/util/theme.dart';
import 'package:flutter/material.dart';
import '../../config/flavors.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;
  final bool? showBanner;

  const ColoredSafeArea(
      {Key? key,
      required this.child,
      this.color = onPrimaryColor,
      this.showBanner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showBanner ?? false
        ? Banner(
            message: F.name,
            location: BannerLocation.topStart,
            child: safeWidget(context),
            color: Colors.blue.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
          )
        : safeWidget(context);
  }

  Widget safeWidget(BuildContext context) {
    return Container(
        color: color ?? Theme.of(context).appBarTheme.backgroundColor,
        child: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: child,
          ),
        ));
  }
}
