import 'package:cse_night/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/fluro_router.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = Router();
    FluroRouter.configureRoutes(router);
    FluroRouter.router = router;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black),
    );

    return ChangeNotifierProvider<User>(
      builder: (_) => User(),
      child: MaterialApp(
        title: 'CSE Night',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          fontFamily: "FantaisieArtistique",
          primaryColor: Colors.black,
          primaryColorDark: Colors.black,
          accentColor: Colors.amber,
        ),
        onGenerateRoute: FluroRouter.router.generator,
      ),
    );
  }
}
