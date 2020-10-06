import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:camera/camera.dart';
import 'package:shake/shake.dart';
import 'bottomSheet.dart';
import 'camera.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      title: 'Labelcheck',
      material: (context, target) => MaterialAppData(
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          errorColor: Colors.red,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.amberAccent,
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
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      shakeThresholdGravity: 2,
      onPhoneShake: () => setState(() {
        print('shake');
        Fluttertoast.showToast(
            msg: "Please hold the Device Still",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black38,
            textColor: Colors.white,
            fontSize: 16.0);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () => takePhoto().then(
          (value) => showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) => CustomBottomSheet(value),
          ),
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
        ],
      ),
    );
  }
}
