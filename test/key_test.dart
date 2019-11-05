import 'package:cse_night/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test key group generation 1", () {
    String key = User.generateUniqueKeyForId("180573G");
    expect(key, isNotNull);
    expect(int.parse(key.substring(0, 9)) % 99929, equals(16561));
    expect(key.substring(9, 10), equals("6"));
    expect(key.substring(11, 12), equals("8"));
    expect(key.substring(13, 14), equals("4"));
  });

  test("Test key group generation 2", () {
    String key = User.generateUniqueKeyForId("180635B");
    expect(key, isNotNull);
    expect(int.parse(key.substring(0, 9)) % 99929, equals(32183));
    expect(key.substring(9, 10), equals("7"));
    expect(key.substring(11, 12), equals("4"));
    expect(key.substring(13, 14), equals("6"));
  });

  test("Test key group generation 3", () {
    String key = User.generateUniqueKeyForId("180371K");
    expect(key, isNotNull);
    expect(int.parse(key.substring(0, 9)) % 99929, equals(77611));
    expect(key.substring(9, 10), equals("4"));
    expect(key.substring(11, 12), equals("8"));
    expect(key.substring(13, 14), equals("2"));
  });

  test("Test key group generation 4", () {
    String key = User.generateUniqueKeyForId("180239N");
    expect(key, isNotNull);
    expect(int.parse(key.substring(0, 9)) % 99929, equals(64577));
    expect(key.substring(9, 10), equals("3"));
    expect(key.substring(11, 12), equals("4"));
    expect(key.substring(13, 14), equals("0"));
  });
}
