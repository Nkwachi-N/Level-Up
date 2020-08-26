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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool displayOne = false;
  bool displayTwo = true;
  String _text = 'You dey the Home Screen';
  String _previousText = '';
  Color backgroundColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Expanded(
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )

              )),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  DragTarget(
          builder: (context, List<String> candidateData,
              rejectedData) {
            return displayOne ? Container(
              color: Colors.transparent,
              height: 40.0,
              width: 100.0,
            ) : _draggable();
          },
          onWillAccept: (data) {
            if (data == "Knight") {
              return true;
            } else {
              return false;
            }
          },
          onAccept: (data) {
            setState(() {
              displayOne = !displayOne;
            });
          },
        ),
                  Spacer(),
                  DragTarget(
                    builder: (context, List<String> candidateData,
                        rejectedData) {
                      return !displayOne ? Container(
                        color: Colors.transparent,
                        height: 40.0,
                        width: 100.0,
                      ) : _draggable();
                    },
                    onWillAccept: (data) {
                      if (data == "Knight") {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    onAccept: (data) {
                      setState(() {
                        displayOne = !displayOne;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),

                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          )),
    );
  }

  Widget _draggable(){
    return Draggable(
      onDragCompleted: (){
        _text = _previousText;
      },
      onDraggableCanceled: (velocity,offset){
        setState(() {
          _text = _previousText;
        });
      },
      onDragStarted: (){
      setState(() {
        _previousText = _text;
        _text = 'See as you hold the bottom Nav like thief, Baba free am na';
      });
    },
      data: 'Knight',
      axis: Axis.horizontal,
      feedback: Container(
        decoration: BoxDecoration(
            color: Colors.purple.shade500,
            borderRadius:
            BorderRadius.circular(16.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple.shade500,
            borderRadius:
            BorderRadius.circular(16.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    backgroundColor = Colors.green.shade600;
                    _text = 'You dey Home tab my G';
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _text = 'You don press the mic, abeg off am';
                    backgroundColor = Colors.teal.shade300;
                  });
                },
                child: Icon(
                  Icons.mic,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _text = 'Star boy, numer One!';
                    backgroundColor = Colors.indigoAccent.shade200;
                  });
                },
                child: Icon(
                  Icons.star,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      childWhenDragging: Container(),
    );
  }
}

class DraggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: "Knight",
      axis: Axis.horizontal,
      feedback: Align(
        alignment: Alignment(-0.9, 0.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple.shade500,
              borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            children: [
              SizedBox(width: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      child: Align(
        alignment: Alignment(-0.9, 0.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple.shade500,
              borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      childWhenDragging: Container(),
    );
  }
}





