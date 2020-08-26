import 'package:cached_network_image/cached_network_image.dart';
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
      routes: Routes.routes,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _firstController;
  FocusNode _focusNode;
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  void initState() {
    super.initState();
    _firstController = TextEditingController();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Form Validation'),
        ),
        body: GestureDetector(
          onTap: (){
         Navigator.pushNamed(context, Routes.details,
         arguments: 'Strings');
          },
          child: Center(
            child:Hero(
              tag: 'hero',
              child: CachedNetworkImage(
                imageUrl: "https://picsum.photos/250?image=9",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        )
          );
  }
}

class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Hero(
              tag: 'hero',
              child: CachedNetworkImage(
                imageUrl: "https://picsum.photos/250?image=9",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(args),
          )
        ],
      )
    );
  }
}
