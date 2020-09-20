import 'package:flutter/material.dart';
import './contentsImage.dart';

class DetailDialog extends StatelessWidget {
  final String text;
  DetailDialog({Key key, @required this.text}) : super(key: key);

  String getTextonDb(){
    return this.text == null ? 'null' : 'not null';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(getTextonDb()),
          ContentsImage(contentsId:this.text),
        ],
      ),
    );
  }
}
