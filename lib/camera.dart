import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      cameras[0],
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Center(
        child: Text('Loading..'),
      );
    }

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return Transform.scale(
      scale: controller.value.aspectRatio / deviceRatio,
      child: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ),
      ),
    );
  }
}
