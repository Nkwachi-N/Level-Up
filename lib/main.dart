import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:level_up/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple.shade400),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, RouteAnimation.createRoute(Page2()));
              },
              child: Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.green,
        height: 50.0,
      ),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}




