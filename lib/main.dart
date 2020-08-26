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

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _firstController;
  FocusNode _focusNode;
  TabController _controller;

  final items = List<ListItem>.generate(200,
        (i) => i % 6 == 0
        ? HeadingItem("Heading $i")
        : MessageItem("Sender $i", "Message body $i"),
  );

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
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool isScrolled){
              return[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.cancel),
                      ),
                      Tab(
                        icon: Icon(Icons.cancel),
                      ),
                      Tab(
                        icon: Icon(Icons.cancel),
                      )
                    ],
                  ),
                  centerTitle: true,
                  title: Text('Floating app bar'),
                  flexibleSpace: Container(
                    color: Colors.green.shade500,
                  )
                )
              ];
            }, body: TabBarView(children: [
              CustomScrollView(
                slivers: [
                  SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                          (context, index) => ListTile(title: Text('Item #$index')),
                      // Builds 1000 ListTiles
                      childCount: 1000,
                    ),
                  )

                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                          (context, index) => ListTile(title: Text('Item #$index')),
                      // Builds 1000 ListTiles
                      childCount: 1000,
                    ),
                  )

                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                          (context, index) => ListTile(title: Text('Item #$index')),
                      // Builds 1000 ListTiles
                      childCount: 1000,
                    ),
                  )

                ],
              )
            ]))
        ),
      ),
    );
  }
}




abstract class ListItem{
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}
/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Column(
    children: [
      Icon(Icons.graphic_eq),
      Text(sender)
    ],
  );

  Widget buildSubtitle(BuildContext context) => Text(body);
}