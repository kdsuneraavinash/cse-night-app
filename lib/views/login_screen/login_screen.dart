import 'package:cse_night/models/user.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginPageState currentUserState;

  @override
  void initState() {
    super.initState();
    PermissionHandler().requestPermissions([PermissionGroup.camera]).then((v) {
      _changeToGuestState();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Provider.of<User>(context).loadFromStorage(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackDropWidget(
        animating: true,
        child: Column(
          children: <Widget>[
            Flexible(flex: 8, child: Container()),
            Flexible(
              flex: 2,
              child: Consumer<User>(
                builder: (_, user, __) => Center(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 800),
                    child: _buildStateWidget(user),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateWidget(User user) {
    if (user.isLoggedIn) {
      return Text(
        "Loggin In [${user.username}]",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.amber,
        ),
      );
    } else if (currentUserState == LoginPageState.Initialized) {
      return FloatingActionButton.extended(
        onPressed: _handleLogin,
        label: Text("Scan Your ID"),
        icon: Icon(MdiIcons.idCard),
      );
    } else {
      return SpinKitRotatingCircle(
        size: 25,
        color: Colors.amber,
      );
    }
  }

  void _handleLogin() async {
    String id = await FluroRouter.navigate(context, '/camera/id');
    Provider.of<User>(context, listen: false).logIn(context, id);
  }

  void _changeToGuestState() async {
    currentUserState = LoginPageState.Initializing;
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {
        currentUserState = LoginPageState.Initialized;
      });
    }
  }
}

enum LoginPageState {
  Initialized,
  Initializing,
}
