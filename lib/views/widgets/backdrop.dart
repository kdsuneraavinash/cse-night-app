import 'package:flutter/material.dart';

class BackDropWidget extends StatelessWidget {
  final Widget child;
  final bool animating;
  final int overlayOpacity;

  const BackDropWidget(
      {Key key, this.child, this.animating = false, this.overlayOpacity = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage(animating
                ? "assets/images/glitched-eye.gif"
                : "assets/images/eye.png"),
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
                Colors.black.withAlpha(overlayOpacity), BlendMode.srcATop)),
      ),
      child: child,
    );
  }
}
