import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Form Validation'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              background:Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(0.9, 0.0),
                  child: Text('Delete',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
              key: Key(items[index]),
              onDismissed: (direction)
              {
                setState(() {
                  items.removeAt(index);
                });

                // Show a snackbar. This snackbar could also contain "Undo" actions.
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("${items[index]} dismissed")));

              },
              child: ListTile(

                title: Text('${items[index]}'),
              ),
            );
          },
        ));
  }
}

/*OrientationBuilder(builder: (context,orientation){
        return GridView.count(crossAxisCount: orientation == Orientation.portrait ? 2 : 3);
      })*/
