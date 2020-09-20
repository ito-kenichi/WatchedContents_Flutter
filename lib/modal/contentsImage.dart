import 'package:flutter/material.dart';

class ContentsImage extends StatelessWidget {
  final String contentsId;
  ContentsImage({Key key, @required this.contentsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 3.0,
          child: new Image.asset(
            this.contentsId,
            width: 800,
            height: 600,
          ),
        ),
      ),
    );
  }
}
