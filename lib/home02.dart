import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarB extends StatefulWidget with PreferredSizeWidget {

  @override
  _AppBarBState createState() => _AppBarBState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarBState extends State<AppBarB> {

  List<MapEntry<int, Color>> colorsList = [
    MapEntry(1, Colors.yellow),
    MapEntry(2, Colors.yellow),
    MapEntry(3, Colors.yellow),
    MapEntry(4, Colors.yellow),
    MapEntry(5, Colors.yellow),
    MapEntry(6, Colors.yellow),
    MapEntry(7, Colors.yellow),
    MapEntry(8, Colors.yellow),
    MapEntry(9, Colors.yellow),
    MapEntry(10, Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: new List.generate(colorsList.length, (index) {
        return new GridTile(
          child: new Card(
            color: Colors.amberAccent,
            child: RaisedButton(
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                padding: EdgeInsets.only(
                    top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                onPressed: () {
                  if (colorsList[index].value == Colors.black) {
                    setState(() {
                      colorsList[index] = MapEntry(index, Colors.yellow);
                    });
                  } else {
                    setState(() {
                      colorsList[index] = MapEntry(index, Colors.black);
                    });
                  }
                },
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/image' + index.toString().padLeft(3, "0") + '.png',
                      height: 60.0,
                      width: 60.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "P",
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        )
                    )
                  ],
                ),
                textColor: Color(0xFF292929),
                color: colorsList[index].value
            ),
          ),
        );
      }),
    );
  }


  @override
  void initState() {
    super.initState();
    print("Home02, initState");
  }
}