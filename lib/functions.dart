import 'package:flutter_mailer/flutter_mailer.dart';
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
  var output = await Tflite.runModelOnImage(path: path, numResults: 1);
  //print(output);
  return output;
}

sendMailReport(imagepath) async {
  final MailOptions mailOptions = MailOptions(
    body:
        'Please only send if Photo actually contains a label! (You need to use an Email Client)',
    subject: 'Labelcheck Error',
    recipients: ['bronzel.phillip@gmail.com'],
    attachments: [
      imagepath,
    ],
  );
  await FlutterMailer.send(mailOptions);
}

parseLabel(input) {
  return input
      .toString()
      .replaceAll('label: ', '')
      .replaceAll('}]', '')
      .replaceAll('}', '')
      .trim()
      .split(',')
      .elementAt(2);
}

parseConfidence(input) {
  return double.parse(input
      .toString()
      .replaceAll('confidence: ', '')
      .replaceAll('[{', '')
      .trim()
      .split(',')
      .elementAt(0));
}

parseIndex(input) {
  return int.parse(input
      .toString()
      .replaceAll('index: ', '')
      .trim()
      .split(',')
      .elementAt(1));
}

class Result {
  Result(input) {
    label = parseLabel(input).trim();
    confidence = parseConfidence(input);
    index = parseIndex(input);
  }

  double confidence;
  int index;
  String label;
}
