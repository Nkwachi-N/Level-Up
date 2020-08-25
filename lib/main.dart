import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple.shade400
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  /*TabController _tabController = TabController(
    length: 3, vsync: this
  );*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text('Day One')),
                color: Colors.green.shade400,
              ),
              TabBar(tabs:[
                Tab(
                  icon: Icon(Icons.home,
                  color: Colors.black,),
                ),
                Tab(
                  icon: Icon(Icons.card_travel,
                  color: Colors.black,),
                ),
                Tab(
                  icon: Icon(Icons.shop,
                  color: Colors.black,),
                )
              ]),
              Expanded(child: TabBarView(children: [
                Container(
                  color:Colors.indigo,
                  child: Text('Home'),
                ),
                Container(
                  color: Colors.yellow.shade900,
                ),
                Container(
                  color: Colors.green,
                  child: Text('Home'),
                )

              ]))
            ],
          ),
        ),

      ),
    );
  }
}


