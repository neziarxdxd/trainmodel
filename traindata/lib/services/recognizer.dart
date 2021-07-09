import 'package:tflite/tflite.dart';

class Recognizer {
  Future loadModel() {
    Tflite.close();
    // TODO: add path
    return Tflite.loadModel(model: "", labels: "");
  }
}
