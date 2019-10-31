import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_night/models/puzzle_rand.dart';
import 'package:cse_night/models/puzzles.dart';
import 'package:cse_night/models/user.dart';
import 'package:cse_night/utils/alert.dart';
import 'package:cse_night/views/home_screen/progress_circle.dart';
import 'package:cse_night/views/home_screen/puzzle_tile.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:cse_night/views/widgets/camera_fab.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  final maxPlayersCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackDropWidget(
        animating: true,
        overlayOpacity: 120,
        child: Center(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection('players').snapshots(),
                    builder: (context, snapshot) {
                      int currentCount = snapshot?.data?.documents
                              ?.where((qs) => qs?.data["finished"])
                              ?.length ??
                          0;
                      if (currentCount > maxPlayersCount)
                        currentCount = maxPlayersCount;
                      return ProgressCircleWidget(
                        current: currentCount,
                        maxCount: maxPlayersCount,
                      );
                    },
                  ),
                ),
              ),
              Consumer<User>(
                builder: (_, user, __) => Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      String puzzleType = Puzzles.puzzleTypes[index];

                      return PuzzleTileWidget(
                        title: Puzzles.puzzleName(puzzleType),
                        puzzleType: puzzleType,
                        puzzleIndex: PuzzleRand.getRandomPuzzleId(
                          user.username,
                          puzzleType,
                        ),
                        taskStatus: (user.progress == index)
                            ? PuzzleState.Unlocked
                            : (user.progress > index)
                                ? PuzzleState.Done
                                : PuzzleState.Locked,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: CircularNotchedRectangle(),
          child: Consumer<User>(
            builder: (_, user, __) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    onPressed: () async {
                      bool isLogout = await Alert.showYesNoBox(context,
                          "Are you sure you want to log out?\n\nAll your progress in this device will be lost.");
                      if (isLogout) {
                        user.logout(context);
                      }
                    },
                    child: Text("Logout"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      Alert.showAlertBox(context,
                          "Each clue will lead you to next.\n\n[Add more help data]");
                    },
                    child: Text("Help"),
                  ),
                )
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CameraFAB(),
    );
  }
}
