import 'package:flutter/material.dart';
import 'package:traindata/screen/drawing_paint.dart';
import 'package:traindata/utils/constant.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  // TODO: add await recognizer
  final _points = List<Offset>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Kulitan Test"),
        ),
        body: Container(
            width: Constants.canvasSize,
            height: Constants.canvasSize,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                Offset _localPosition = details.localPosition;
                setState(() {
                  _points.add(_localPosition);
                });
              },
              onPanEnd: (DragEndDetails details) {
                _points.add(null);
              },
              child: CustomPaint(
                painter: DrawingPainter(_points),
              ),
            )));
  }
}
