import 'package:flutter/material.dart';
import 'package:traindata/model/prediction.dart';
import 'package:traindata/screen/drawing_paint.dart';
import 'package:traindata/services/recognizer.dart';
import 'package:traindata/utils/constant.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  final _recognizer = Recognizer();
  final _points = List<Offset>();
  List<Prediction> _prediction;
  bool initialize = false;

  @override
  void initState() {
    super.initState();
    _initModel();
  }

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

  Widget _drawCanvasWidget() {
    return Container(
      width: Constants.canvasSize + Constants.borderSize * 2,
      height: Constants.canvasSize + Constants.borderSize * 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: Constants.borderSize,
        ),
      ),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          Offset _localPosition = details.localPosition;
          if (_localPosition.dx >= 0 &&
              _localPosition.dx <= Constants.canvasSize &&
              _localPosition.dy >= 0 &&
              _localPosition.dy <= Constants.canvasSize) {
            setState(() {
              _points.add(_localPosition);
            });
          }
        },
        onPanEnd: (DragEndDetails details) {
          _points.add(null);
          _recognize();
        },
        child: CustomPaint(
          painter: DrawingPainter(_points),
        ),
      ),
    );
  }

  void _initModel() async {
    var res = await _recognizer.loadModel();
  }

  void _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    setState(() {
      _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    });
  }
}
