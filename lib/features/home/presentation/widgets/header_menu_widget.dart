import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/util/theme.dart';

class HeaderMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.card_giftcard,
          size: kIconM,
        ),
        Flexible(
          child: Text(
            'The Gardens appartment 1 ',
            style: headline6,
          ),
        ),
        Icon(
          Icons.person,
          size: kIconM,
        ),
      ],
    );
  }
}
