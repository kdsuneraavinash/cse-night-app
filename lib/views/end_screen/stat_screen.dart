import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_night/models/names.dart';
import 'package:cse_night/models/valid_ids.dart';
import 'package:cse_night/views/widgets/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;

class StatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        centerTitle: true,
      ),
      body: BackDropWidget(
        animating: true,
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("players")
                .where("finished", isEqualTo: true)
                .orderBy("finished_time")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot?.data?.documents == null) {
                return SpinKitDualRing(
                  color: Theme.of(context).accentColor,
                );
              }

              List<DocumentSnapshot> documents = snapshot.data.documents;

              return ListView.builder(
                itemCount: documents.length - 1,
                itemBuilder: (_, index) {
                  Map<String, dynamic> playerData = documents[index].data;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (index < 30)
                          ? Colors.green
                          : Theme.of(context).accentColor,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(
                      NameManager.names[int.tryParse(
                              playerData["id"].toString().substring(0, 6))] +
                          " [${playerData["id"]}]",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    trailing: Text(
                        TeamManager
                            .groups[ValidIdStore.getGroup(playerData["id"])],
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                        timeago.format(
                            (playerData["finished_time"] as Timestamp)
                                .toDate()),
                        style: TextStyle(color: Colors.white)),
                  );
                },
              );
            }),
      ),
    );
  }
}
