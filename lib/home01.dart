import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './database_helper.dart';

class AppBarA extends StatefulWidget with PreferredSizeWidget {

  @override
  _AppBarAState createState() => _AppBarAState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarAState extends State<AppBarA> {

  final dbHelper = DatabaseHelper.instance;

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
                    _insert();
                    _query();
                    setState(() {
                      colorsList[index] = MapEntry(index, Colors.yellow);
                    });
                  } else {
                    _delete();
                    _query();
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

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'Bob',
      DatabaseHelper.columnAge  : 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge  : 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }

  @override
  void initState() {
    super.initState();
    print("Home01, initState");
  }
}