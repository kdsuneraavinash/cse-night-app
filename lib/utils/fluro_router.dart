import 'package:cse_night/views/camera_screen/camera.dart';
import 'package:cse_night/views/end_screen/end_screen.dart';
import 'package:cse_night/views/home_screen/home.dart';
import 'package:cse_night/views/login_screen/login_screen.dart';
import 'package:cse_night/views/puzzle_screen/hieroglyphics_puzzle.dart';
import 'package:cse_night/views/puzzle_screen/map_puzzle.dart';
import 'package:cse_night/views/puzzle_screen/number_answer.dart';
import 'package:cse_night/views/puzzle_screen/number_puzzle.dart';
import 'package:cse_night/views/puzzle_screen/photo_puzzle.dart';
import 'package:cse_night/views/puzzle_screen/text_puzzle.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import 'alert.dart';

class FluroRouter {
  static Router router;

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, _) {
        Alert.showAlertBox(context, "Invalid route");
        return Container();
      },
      type: HandlerType.function,
    );

    router.define(
      '/',
      handler: Handler(
        handlerFunc: (context, _) => LoginScreen(),
      ),
    );

    router.define(
      "/camera/id",
      handler: Handler(
        handlerFunc: (context, params) => CameraUI(
          formats: [CodeFormat.code39],
        ),
      ),
    );

    router.define(
      "/camera/puzzle",
      handler: Handler(
        handlerFunc: (context, params) => CameraUI(
          formats: [CodeFormat.qr],
        ),
      ),
    );

    router.define(
      "/home",
      handler: Handler(
        handlerFunc: (context, params) => HomeScreen(),
      ),
    );

    router.define(
      "/end",
      handler: Handler(
        handlerFunc: (context, params) => EndScreen(),
      ),
    );

    router.define(
      "/puzzles/text/:index",
      handler: Handler(
        handlerFunc: (context, params) => TextPuzzle(
          index: int.parse(params["index"][0]),
        ),
      ),
    );

    router.define(
      "/puzzles/photo/:index",
      handler: Handler(
        handlerFunc: (context, params) => PhotoPuzzle(
          index: int.parse(params["index"][0]),
        ),
      ),
    );

    router.define(
      "/puzzles/number/:index",
      handler: Handler(
        handlerFunc: (context, params) => NumberPuzzle(
          index: int.parse(params["index"][0]),
        ),
      ),
    );

    router.define(
      "/puzzles/number_answer",
      handler: Handler(
        handlerFunc: (context, params) => NumberAnswerScreen(),
      ),
    );

    router.define(
      "/puzzles/map/:index",
      handler: Handler(
        handlerFunc: (context, params) => MapPuzzle(
          index: int.parse(params["index"][0]),
        ),
      ),
    );

    router.define(
      "/puzzles/hieroglyphics/:index",
      handler: Handler(
        handlerFunc: (context, params) => HieroglyphicsPuzzle(
          index: int.parse(params["index"][0]),
        ),
      ),
    );
  }

  static Future<dynamic> navigate(
    BuildContext context,
    String path, {
    bool replace = false,
    TransitionType transition = TransitionType.cupertino,
    Duration transitionDuration = const Duration(milliseconds: 250),
  }) {
    return router.navigateTo(
      context,
      path,
      replace: replace,
      transition: transition,
      transitionDuration: transitionDuration,
    );
  }
}
