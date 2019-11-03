import 'package:cse_night/utils/alert.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProgressCircleWidget extends StatelessWidget {
  final int current;
  final int maxCount;

  const ProgressCircleWidget({
    Key key,
    @required this.current,
    @required this.maxCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color transitColor;
    if (current * 2 > maxCount) {
      transitColor = Color.lerp(
        Color(0xffFBC02D), // #FBC02D
        Color(0xff004D40), // #004D40
        (current / maxCount) * 2 - 1,
      );
    } else {
      transitColor = Color.lerp(
        Color(0xffb71c1c), // #b71c1c
        Color(0xffFBC02D), // #FBC02D
        (current / maxCount) * 2,
      );
    }

    bool isCompleted = current == maxCount;

    double size = MediaQuery.of(context).size.width * 0.4;
    double coverSize = size * 1.5;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        if (isCompleted)
          SpinKitPulse(
            color: transitColor,
            size: coverSize,
          ),
        Container(
          width: coverSize,
          height: coverSize,
          alignment: Alignment.center,
          child: SizedBox(
            width: size,
            height: size,
            child: GestureDetector(
              onTap: isCompleted
                  ? () => FluroRouter.navigate(context, "/end")
                  : () {
                      Alert.showAlertBox(context,
                          "Door shall open when $maxCount has reached the end of the road.\n\n$current/$maxCount");
                    },
              child: LiquidCircularProgressIndicator(
                value: current / maxCount,
                valueColor: AlwaysStoppedAnimation(transitColor),
                backgroundColor: Colors.white,
                borderColor: transitColor,
                borderWidth: 3.0,
                direction: Axis.vertical,
                center: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isCompleted
                      ? Icon(
                          MdiIcons.gestureTap,
                          size: 48,
                          color: Colors.white,
                        )
                      : Text(
                          "${(100 * current / maxCount).round()}%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
