import 'dart:math';

import 'package:cse_night/models/firestore.dart';
import 'package:cse_night/models/keys.dart';
import 'package:cse_night/models/puzzle_rand.dart';
import 'package:cse_night/models/puzzles.dart';
import 'package:cse_night/utils/fluro_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/alert.dart';
import 'valid_ids.dart';

class User extends ChangeNotifier {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String _username;
  int _progressIndex;

  String get username => _username;

  int get progress => _progressIndex;

  bool get isFinishedPuzzles => _progressIndex >= Puzzles.puzzleTypes.length;

  bool get isLoggedIn => _username != null;

  String generateUniqueKey() {
    int group = ValidIdStore.getGroup(_username);
    int prime = 99929;
    List<int> groupPrime = [16561, 32183, 77611, 64577];
    Random random = Random.secure();

    int randomNumber = random.nextInt(pow(2, 32));
    int currentMod = randomNumber % prime;
    int requiredAdd = (groupPrime[group] - currentMod);
    randomNumber += requiredAdd;

    assert(randomNumber % prime == groupPrime[group], "Calculation Logic Bug");

    String result = randomNumber.toString().padLeft(10, '0');
    String fakePad = random.nextInt(99999).toString().padLeft(5, '0');

    result += fakePad;
    assert(
        int.parse(result.substring(0, result.length - 5)) % prime ==
            groupPrime[group],
        "Calculation Logic Bug (After Pad)");

    return result;
  }

  void scanQR(BuildContext context, String scannedKey) {
    if (_progressIndex == null || _progressIndex < 0 || _username == null) {
      Alert.showAlertBox(context,
          "Invalid progression status. Please reinstall or clean caches");
      return;
    }

    if (isFinishedPuzzles) {
      Alert.showAlertBox(context, "All puzzles already solved.");
      return;
    }

    String puzzleType = Puzzles.puzzleTypes[_progressIndex];
    String realKey = Keys.getKey(
        puzzleType, PuzzleRand.getRandomPuzzleId(_username, puzzleType));

    if (realKey == scannedKey) {
      _progressIndex++;
      userProgressed();
    } else {
      Alert.showAlertBox(context, "Invalid QR Scanned.");
    }
  }

  void logout(BuildContext context) async {
    await storage.delete(key: "current_user");
    await storage.delete(key: "${username}_progression");
    _username = null;
    _progressIndex = null;
    FluroRouter.navigate(context, '/', replace: true);
  }

  void logIn(BuildContext context, String id, [int currentProgress = 0]) async {
    if (id == null || id == "") {
      // Cancelled
    } else {
      RegExpMatch match = RegExp("^([0-9]{6}[a-zA-Z])\$").firstMatch(id);
      if (match == null) {
        // Unmatching code 39 barcode
        Alert.showAlertBox(context, "Invalid ID Detected");
      } else if (ValidIdStore.isValidId(id)) {
        // Valid
        _username = id;
        _progressIndex = currentProgress;
        userProgressed();
        await Future.delayed(Duration(seconds: 2));
        FluroRouter.navigate(context, '/home', replace: true);
      } else {
        Alert.showAlertBox(context, "Unauthorized ID Detected");
        // Unmatching valid id(other dept)
      }
    }
  }

  Future<void> loadFromStorage(BuildContext context) async {
    String currentUser = await storage.read(key: "current_user");
    if (currentUser == null) return;

    String progressionString =
        await storage.read(key: "${currentUser}_progression");

    if (progressionString == null) return;

    int progression = int.parse(progressionString);
    logIn(context, currentUser, progression);
  }

  Future<void> saveToStorage() async {
    await storage.write(key: "current_user", value: _username);
    await storage.write(
        key: "${username}_progression", value: "$_progressIndex");
  }

  void userProgressed() {
    notifyListeners();
    FirebaseController.saveProgression(this);
    saveToStorage();
  }
}
