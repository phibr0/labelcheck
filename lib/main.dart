import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:camera/camera.dart';
import 'bottomSheet.dart';
import 'camera.dart';

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
          errorColor: Colors.redAccent,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => CustomBottomSheet(),
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
