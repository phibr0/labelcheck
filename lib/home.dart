import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labelcheck/functions.dart';
import 'package:shake/shake.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'aboutPage.dart';
import 'bottomSheet.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'camera.dart';
import 'generated/l10n.dart';

class Home extends StatefulWidget {
  Home(this.size);

  final size;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAnalytics analytics;
  Offset position;

  void initState() {
    super.initState();
    analytics = FirebaseAnalytics();
    position = Offset(widget.size.width / 2 - 28, widget.size.height - 75);
    ShakeDetector.autoStart(
      shakeThresholdGravity: 2,
      onPhoneShake: () => setState(
        () {
          Fluttertoast.showToast(
            msg: S.of(context).deviceShake,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraView(),
          Center(
            child: Image.asset(
              'assets/images/finder.png',
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 1.8,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).appName,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => About(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              feedback: Container(
                child: FloatingActionButton(
                  child: Icon(Icons.camera),
                  onPressed: () {},
                ),
              ),
              child: GestureDetector(
                onLongPress: () async => await ImagePicker()
                    .getImage(source: ImageSource.gallery)
                    .then(
                  (pickedFile) async {
                    await ImageCrop.requestPermissions();
                    if (pickedFile != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cropper(pickedFile.path),
                        ),
                      );
                    }
                  },
                ),
                child: FloatingActionButton(
                  onPressed: () async {
                    await ImageCrop.requestPermissions();
                    takePhoto().then(
                      (path) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cropper(path),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.camera),
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(
                  () {
                    position = details.offset;
                  },
                );
                print(position);
                print(position.dx);
                print(position.dy);
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Cropper extends StatefulWidget {
  final String path;
  File imgFile;
  Cropper(this.path) {
    this.imgFile = File(path);
  }
  @override
  _CropperState createState() => _CropperState();
}

class _CropperState extends State<Cropper> {
  var analytics;
  @override
  void initState() {
    super.initState();
    analytics = FirebaseAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Crop(
              key: cropKey,
              alwaysShowGrid: true,
              image: FileImage(widget.imgFile),
              aspectRatio: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    classifyImage(widget.path).then(
                      (result) async {
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) =>
                              CustomBottomSheet(result, widget.path),
                        );
                        await analytics.logEvent(
                          name: 'imageFromCamera',
                          parameters: <String, dynamic>{
                            'result': result.toString()
                          },
                        );
                      },
                    );
                  },
                  child: Text('Scan'),
                ),
                SizedBox(
                  height: 12,
                  width: double.infinity,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
