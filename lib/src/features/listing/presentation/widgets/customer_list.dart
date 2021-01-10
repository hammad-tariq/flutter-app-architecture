import 'package:flutter/material.dart';
import 'customer_card.dart';

class CustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return CustomerCard();
      },
    ));
  }
}
