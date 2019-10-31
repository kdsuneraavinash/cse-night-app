import 'package:cse_night/utils/alert.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'focus_square.dart';

class CameraUI extends StatefulWidget {
  final List<CodeFormat> formats;

  const CameraUI({Key key, @required this.formats}) : super(key: key);

  @override
  _CameraUIState createState() => _CameraUIState();
}

class _CameraUIState extends State<CameraUI> {
  QRReaderController controller;

  @override
  void initState() {
    super.initState();
    _initCameraAfterSomeTime();
  }

  void _initCameraAfterSomeTime() async {
    await Future.delayed(Duration(milliseconds: 750));
    List<CameraDescription> cameras = await AvailableCameras.cameras;
    _handleNewCameraSelected(cameras[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildCameraPreviewWidget(),
          FocusSquare(color: Colors.black.withAlpha(10)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Cancel"),
        icon: Icon(MdiIcons.close),
        onPressed: () {
          if (mounted) Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildCameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Icon(
        MdiIcons.cameraIris,
        color: Colors.white,
        size: 56,
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: QRReaderPreview(controller),
      );
    }
  }

  void _handleCodeRead(dynamic value) {
    Navigator.pop(context, value);
  }

  void _handleError(String message) {
    Alert.showAlertBox(context, message);
  }

  void _handleNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = QRReaderController(
      cameraDescription,
      ResolutionPreset.low,
      widget.formats,
      _handleCodeRead,
    );

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        _handleError('Camera Error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on QRReaderException catch (e) {
      _handleError('Error: ${e.description}');
    }

    if (mounted) {
      setState(() {});
      controller.startScanning();
    }
  }
}

class AvailableCameras {
  static Future<List<CameraDescription>> get cameras async {
    try {
      return await availableCameras();
    } on QRReaderException {
      return [];
    }
  }
}
