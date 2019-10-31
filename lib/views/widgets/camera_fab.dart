import 'package:cse_night/models/firestore.dart';
import 'package:cse_night/models/user.dart';
import 'package:cse_night/utils/alert.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CameraFAB extends StatefulWidget {
  @override
  _CameraFABState createState() => _CameraFABState();
}

class _CameraFABState extends State<CameraFAB> {
  bool uploading;

  @override
  void initState() {
    uploading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (_, user, __) => user.isFinishedPuzzles
          ? FloatingActionButton(
              child: Icon(MdiIcons.progressUpload),
              onPressed:
                  uploading ? null : () => _uploadProgress(context, user),
            )
          : FloatingActionButton(
              child: Icon(MdiIcons.qrcode),
              onPressed: () => _handleCamera(context, user),
            ),
    );
  }

  void _uploadProgress(BuildContext context, User user) async {
    setState(() {
      uploading = true;
    });
    await FirebaseController.saveProgression(user);
    setState(() {
      uploading = false;
    });
    Alert.showAlertBox(context, "Your progress updated.");
  }

  void _handleCamera(BuildContext context, User user) async {
    String qr = await FluroRouter.navigate(context, '/camera/puzzle');
    if (qr == null || qr == "") return;
    user.scanQR(context, qr);
  }
}
