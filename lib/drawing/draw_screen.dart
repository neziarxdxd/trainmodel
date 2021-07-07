import 'package:flutter/material.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
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
}
