// ignore_for_file: file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class KameraPage extends StatefulWidget {
  const KameraPage({Key? key}) : super(key: key);

  @override
  _KameraPageState createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  bool _isCameraInitialized = false;
  bool isReady = false;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentZoomLevel = 1.0;
  double _currentExposureOffset = 0.0;
  FlashMode? _currentFlashMode;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    prepareCamera();
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
    _currentExposureOffset = 0.0;
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController
            .getMinExposureOffset()
            .then((value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        isReady = controller!.value.isInitialized;
      });
    }
  }

  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  prepareCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], currentResolutionPreset);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isReady = true;
        DropdownButton<ResolutionPreset>(
          dropdownColor: Colors.black87,
          underline: Container(),
          value: currentResolutionPreset,
          items: [
            for (ResolutionPreset preset
                in resolutionPresets)
              DropdownMenuItem(
                child: Text(
                  preset
                      .toString()
                      .split('.')[1]
                      .toUpperCase(),
                  style:
                      TextStyle(color: Colors.white),
                ),
                value: preset,
              )
          ],
          onChanged: (value) {
            setState(() {
              currentResolutionPreset = value!;
              _isCameraInitialized = false;
            });
            onNewCameraSelected(controller!.description);
          },
          hint: Text("Select item"),
        );
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        print('Error Kamera');
      }
      setState(() {
        isReady = false;
      });
    });
  }

  checkCamera() async {
    _cameras = await availableCameras();
  }

  

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(controller),
    );
    
  }

  
  
  
}