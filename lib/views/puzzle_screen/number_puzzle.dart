import 'package:cse_night/models/puzzles.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NumberPuzzle extends StatelessWidget {
  final int index;

  const NumberPuzzle({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Puzzles.puzzleName("number")),
        centerTitle: true,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(Puzzles.numberPuzzle(index)),
          backgroundDecoration: BoxDecoration(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FluroRouter.navigate(context, "/puzzles/number_answer");
        },
        child: Icon(MdiIcons.numeric),
      ),
    );
  }
}
