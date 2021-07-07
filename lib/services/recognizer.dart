import 'package:tflite/tflite.dart';

class Recognizer {
  Future loadModel() {
    Tflite.close();
    return Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }
}
