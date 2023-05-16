import 'package:flutter/material.dart';
import '../screens/cart/components/body.dart';

class Restaurant_list extends StatelessWidget {
  static String routeName = "/Restaurants_list";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants list"),
      ),
      body: Body(),
    );
  }
}