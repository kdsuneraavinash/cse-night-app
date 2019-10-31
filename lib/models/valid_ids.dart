class ValidIdStore {
  static Map<String, int> get data => {
        '100001Z': 1,
        '100002Z': 2,
        '100003Z': 3,
        '100004Z': 0,
        '100006Z': 1,
        '100007Z': 2,
        '100008Z': 3,
        '100009Z': 0,
        '170081L': 1,
        '170074T': 2,
        '170153K': 3,
        '170031K': 0,
        '170176H': 1,
        '170275K': 2,
        '170396G': 3,
        '170109H': 0,
      };

  static bool isValidId(String id) {
    return data.containsKey(id);
  }

  static int getGroup(String id) {
    if (isValidId(id)) {
      return data[id];
    }
    return 999;
  }
}
