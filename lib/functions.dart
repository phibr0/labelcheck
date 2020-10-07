import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future classifyImage(String path) async {
  await Tflite.loadModel(
    model: "assets/model/model.tflite",
    labels: "assets/model/labels.txt",
  );
  var output = await Tflite.runModelOnImage(path: path);
  print(output);
  return output;
}
