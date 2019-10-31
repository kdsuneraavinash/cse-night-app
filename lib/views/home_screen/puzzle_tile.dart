import 'package:cse_night/utils/fluro_router.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PuzzleTileWidget extends StatelessWidget {
  const PuzzleTileWidget({
    Key key,
    @required this.taskStatus,
    @required this.title,
    @required this.puzzleType,
    @required this.puzzleIndex,
  }) : super(key: key);

  final PuzzleState taskStatus;
  final String puzzleType;
  final int puzzleIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isPuzzleLocked = (taskStatus == PuzzleState.Locked);
    bool isPuzzleDone = (taskStatus == PuzzleState.Done);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x227d7e7d),
            Color(0x440e0e0e),
            Color(0x227d7e7d),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: isPuzzleLocked
            ? null
            : () => FluroRouter.navigate(
                context, "/puzzles/$puzzleType/$puzzleIndex"),
        leading: isPuzzleDone
            ? Icon(MdiIcons.check, color: Colors.green)
            : isPuzzleLocked
                ? Icon(Icons.lock, color: Colors.grey)
                : Icon(MdiIcons.progressClock, color: Colors.amber),
        trailing: isPuzzleLocked
            ? null
            : Icon(Icons.arrow_forward, color: Colors.white),
        title: Text(title,
            style: TextStyle(
                fontSize: 20,
                color: isPuzzleLocked ? Colors.grey : Colors.white)),
      ),
    );
  }
}

enum PuzzleState { Locked, Unlocked, Done }
