
import 'package:flutter/cupertino.dart';
import 'package:level_up/main.dart';

class Routes{
  static const String homeScreen = '/HomeScreen';
  static const String details = '/DetailsScreen';

  static Map<String, Widget Function(BuildContext context)> routes ={
    homeScreen : (context) => Home(),
    details: (context) => DetailScreen()
  };
}
