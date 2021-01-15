import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:image_crop/image_crop.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final cropKey = GlobalKey<CropState>();

Future<dynamic> classifyImage(String path) async {
  final crop = cropKey.currentState;
  File imgFile = File(path);

  final croppedFile = await ImageCrop.cropImage(
    file: imgFile,
    area: crop.area,
  );

  await croppedFile.create();
  print(croppedFile.absolute.path);

  var output = await Tflite.runModelOnImage(
    imageStd: 255.0,
    path: croppedFile.absolute.path,
    numResults: 1,
  );
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
  print(input);
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
  double x = double.parse(input
      .toString()
      .replaceAll('confidence: ', '')
      .replaceAll('[{', '')
      .trim()
      .split(',')
      .elementAt(0));
  x = x / 100;
  return x;
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
    if (input.toString() != '[]') {
      label = parseLabel(input).trim();
      confidence = parseConfidence(input);
      index = parseIndex(input);
    } else {
      confidence = -1;
      index = -1;
      label = 'Error';
    }
  }

  double confidence;
  int index;
  String label;
}
