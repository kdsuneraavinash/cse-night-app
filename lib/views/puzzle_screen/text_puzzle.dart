import 'package:cse_night/models/puzzles.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextPuzzle extends StatelessWidget {
  final int index;

  const TextPuzzle({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Puzzles.puzzleName("text")}",
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
              Puzzles.textPuzzle(index),
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
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
