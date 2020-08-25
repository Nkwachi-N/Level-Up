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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Validation'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    _focusNode.requestFocus();
                  },
                  controller: _firstController,
                  decoration: InputDecoration(hintText: 'Enter Text'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(hintText: 'Enter a'),
                  validator: (value) {
                    if (!value.contains('a')) {
                      return 'Enter just a bossman, it\'s not hard.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(
                          SnackBar(content: Text('Good job!'),
                            action: SnackBarAction(label: 'Hello', onPressed: (){
                              print('Hello');
                            }),
                      ));
                    }
                  })
            ],
          )),
    );
  }
}
