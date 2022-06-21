import 'package:flutter/material.dart';
import '../widgets/customer_list.dart';
import '../widgets/search_field.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Customer listing'),
      ),
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
