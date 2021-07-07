import 'package:flutter/material.dart';
import 'package:trainmodel/services/recognizer.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  final _recognizer = Recognizer();

  @override
  void initState() {
    super.initState();
    _initModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: Text("Kulitan Writing")),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [Expanded(child: Text("Write Kulitan here"))],
            )
          ],
        ),
      ),
    );
  }

  void _initModel() async {
    var res = await _recognizer.loadModel();
    print(res);
  }
}
