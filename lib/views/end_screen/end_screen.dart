import 'package:cse_night/models/user.dart';
import 'package:cse_night/utils/alert.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:cse_night/utils/launcher.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class EndScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('End of the Road'),
          centerTitle: true,
        ),
        body: BackDropWidget(
          animating: true,
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Consumer<User>(
                    builder: (_, user, __) => RaisedButton.icon(
                      label: Text("Reveal Your Key"),
                      icon: Icon(user.isFinishedPuzzles
                          ? MdiIcons.lockOpenOutline
                          : MdiIcons.lockOutline),
                      onPressed: () {
                        if (user.isFinishedPuzzles) {
                          Alert.showAlertBox(
                              context, "Key: ${user.generateUniqueKey()}");
                        } else {
                          Alert.showAlertBox(
                              context, "Key locked until end of the road.");
                        }
                      },
                      color: user.isFinishedPuzzles ? Colors.green : Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                    label: Text("Reveal stats"),
                    icon: Icon(MdiIcons.chartBar),
                    onPressed: () {
                      FluroRouter.navigate(context, '/end/stat');
                    },
                    color: Theme.of(context).accentColor,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Download VR App"),
          icon: Icon(MdiIcons.download),
          onPressed: () {
            Launcher.launchUrl(context, "http://bit.ly/2oCZqyw");
          },
        ));
  }
}
