import 'dart:io';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart';

class DetectionService {
  Interpreter? interpreter;
  final classes = ['glioma', 'meningioma', 'notumor', 'pituitary'];

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset(
      'assets/model/model.tflite',
      options: InterpreterOptions()..threads = 4,
    );
  }

  Future<List<double>> runInference(File imageFile) async {
    if (interpreter == null) {
      throw Exception("Model not loaded yet");
    }

    const inputSize = 128;
    final input = await imageToInputArray(imageFile, inputSize);

    final output = List.generate(1, (_) => List.filled(4, 0.0));

    interpreter!.run(input, output);

    final outList = (output[0] as List)
        .map((e) => (e as num).toDouble())
        .toList();
    return outList;
  }

  Future<List> imageToInputArray(File imageFile, int inputSize) async {
    final bytes = await imageFile.readAsBytes();
    imglib.Image? img = imglib.decodeImage(bytes);

    if (img == null) {
      throw Exception('Unable to decode image');
    }

    final resized = imglib.copyResize(img, width: inputSize, height: inputSize);

    final List input = List.generate(
      1,
      (_) => List.generate(
        inputSize, // height (y)
        (y) => List.generate(
          inputSize, // width (x)
          (x) {
            final pixel = resized.getPixel(x, y);
            final double r = imglib.getRed(pixel).toDouble() / 255.0;
            final double g = imglib.getGreen(pixel).toDouble() / 255.0;
            final double b = imglib.getBlue(pixel).toDouble() / 255.0;
            return [r, g, b];
          },
        ),
      ),
    );

    return input;
  }

  Future<Map<String, dynamic>> analyze(File imageFile) async {
    final scores = await runInference(imageFile);

    int topIndex = 0;
    double topScore = scores[0];
    for (int i = 1; i < scores.length; i++) {
      if (scores[i] > topScore) {
        topScore = scores[i];
        topIndex = i;
      }
    }

    return {
      'index': topIndex,
      'label': classes[topIndex],
      'confidence': topScore,
      'scores': scores,
    };
  }
}
