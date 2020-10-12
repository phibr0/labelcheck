import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labelcheck/functions.dart';
import 'package:shake/shake.dart';
import 'package:tflite/tflite.dart';
import 'bottomSheet.dart';
import 'camera.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Tflite.loadModel(
    model: "assets/model/model.tflite",
    labels: "assets/model/labels.txt",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      title: 'Labelcheck',
      material: (context, target) => MaterialAppData(
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.amberAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          errorColor: Colors.red,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          errorColor: Colors.red[300],
        ),
      ),
      cupertino: (context, target) => CupertinoAppData(
        theme: CupertinoThemeData(
          primaryColor: Colors.amber,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          primaryContrastingColor: Colors.amberAccent,
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAnalytics analytics;

  void initState() {
    super.initState();
    analytics = FirebaseAnalytics();
    ShakeDetector.autoStart(
      shakeThresholdGravity: 2,
      onPhoneShake: () => setState(
        () {
          print('shake');
          Fluttertoast.showToast(
              msg: "Please hold the Device Still",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.black38,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onLongPress: () async =>
            await ImagePicker().getImage(source: ImageSource.gallery).then(
          (pickedFile) async {
            if (pickedFile != null) {
              classifyImage(pickedFile.path).then(
                (result) async {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) =>
                        CustomBottomSheet(result, pickedFile.path),
                  );
                  await analytics.logEvent(
                    name: 'imageFromFile',
                    parameters: <String, dynamic>{'result': result.toString()},
                  );
                },
              );
            }
          },
        ),
        child: FloatingActionButton(
          onPressed: () async {
            takePhoto().then(
              (path) => classifyImage(path).then(
                (result) async {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) =>
                        CustomBottomSheet(result, path),
                  );
                  await analytics.logEvent(
                    name: 'imageFromCamera',
                    parameters: <String, dynamic>{'result': result.toString()},
                  );
                },
              ),
            );
          },
          child: Icon(Icons.camera),
        ),
      ),
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
            alignment: Alignment.topRight,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
