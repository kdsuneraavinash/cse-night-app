import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_night/models/user.dart';

class FirebaseController {
  static Future<void> saveProgression(User user) async {
    try {
      DocumentSnapshot snapshot = await Firestore.instance
          .collection("players")
          .document(user.username)
          .get();

      UserData userData;
      if (snapshot?.data != null) {
        userData = UserData.fromJson(snapshot.data);
        userData = userData.updatedUserData(user.progress);

        if (user.isFinishedPuzzles && !userData.finished) {
          userData = userData.finishedUserData();
        }
      } else {
        userData = UserData.empty(user.username);
        userData = userData.updatedUserData(user.progress);

        if (user.isFinishedPuzzles) {
          userData = userData.finishedUserData();
        }
      }

      Firestore.instance
          .collection("players")
          .document(user.username)
          .setData(userData.toJson());
    } catch (PlatformException) {
      print("Unstable internet connection. Sync failed.");
    }
  }
}

class UserData {
  final String id;
  final Timestamp creationTime;
  final Timestamp lastAccess;
  final Timestamp finishedTime;
  final bool finished;
  final int progression;

  UserData({
    this.id,
    this.creationTime,
    this.lastAccess,
    this.finishedTime,
    this.finished,
    this.progression,
  });

  static UserData empty(String id) {
    Timestamp nowTimestamp = Timestamp.now();
    return UserData(
      id: id,
      creationTime: nowTimestamp,
      lastAccess: nowTimestamp,
      finished: false,
      finishedTime: null,
      progression: 0,
    );
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      creationTime: json['creation_time'],
      lastAccess: json['last_access'],
      finished: json['finished'],
      finishedTime: json['finished_time'],
      progression: json['progression'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creation_time": creationTime,
      "last_access": lastAccess,
      "finished": finished,
      "finished_time": finishedTime,
      "progression": progression,
    };
  }

  UserData copyWith({
    String id,
    Timestamp creationTime,
    Timestamp lastAccess,
    Timestamp finishedTime,
    bool finished,
    int progression,
  }) {
    return UserData(
      id: id ?? this.id,
      creationTime: creationTime ?? this.creationTime,
      lastAccess: lastAccess ?? this.lastAccess,
      finished: finished ?? this.finished,
      finishedTime: finishedTime ?? this.finishedTime,
      progression: progression ?? this.progression,
    );
  }

  UserData finishedUserData() {
    return copyWith(
      finishedTime: Timestamp.now(),
      finished: true,
    );
  }

  UserData updatedUserData(int progress) {
    return copyWith(
      lastAccess: Timestamp.now(),
      progression: progress,
    );
  }
}
