import 'package:cse_night/models/puzzles.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HieroglyphicsPuzzle extends StatelessWidget {
  final int index;

  const HieroglyphicsPuzzle({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Puzzles.puzzleName("hieroglyphics")}",
        ),
        centerTitle: true,
      ),
      body: BackDropWidget(
        animating: true,
        overlayOpacity: 200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Puzzles.hieroglyphicsPuzzle(index),
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 48,
                fontFamily: "Hieroglify",
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(MdiIcons.arrowLeft),
      ),
    );
  }
}
