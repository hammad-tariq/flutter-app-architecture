import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/listing/presentation/widgets/customer_list.dart';
import 'package:flutter_app/src/features/listing/presentation/widgets/search_field.dart';

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SearchField(),
            Expanded(child: CustomerList()),
          ],
        ),
      ),
    );
  }
}
