import 'package:cse_night/models/keys.dart';
import 'package:cse_night/models/puzzles.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PhotoPuzzle extends StatelessWidget {
  final int index;

  const PhotoPuzzle({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Puzzles.puzzleName("photo")} "
          "[${Keys.getKey("photo", index)}]",
        ),
        centerTitle: true,
      ),
      body: BackDropWidget(
        animating: true,
        overlayOpacity: 200,
        child: Center(
          child: PhotoView(
            imageProvider: AssetImage(Puzzles.photoPuzzle(index)),
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
