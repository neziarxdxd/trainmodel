import 'package:tflite/tflite.dart';

class Recognizer {
  Future loadModel() {
    Tflite.close();
    // TODO: add path
    return Tflite.loadModel(
        model: "assets/model_kulitan.tflite", labels: "assets/labels.txt");
  }

  dispose() {
    Tflite.close();
  }
}
