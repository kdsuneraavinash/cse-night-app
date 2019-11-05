class Keys {
  static String getKey(String puzzleType, int index) {
    Map<String, List<String>> data = {
      "text": [
        "sarcophagus",
        "cartouche",
        "oasis",
        "obelisk",
      ],
      "photo": [
        "vizier",
        "amun",
        "senet",
        "thebes",
      ],
      "number": [
        "kinen",
        "scribe",
        "khufu",
        "silt",
      ],
      "map": [
        "delta",
        "hatsheput",
        "ramses",
        "akh",
      ],
      "hieroglyphics": [
        "akhenaten",
        "akhet",
        "capstone",
        "demotic",
      ],
    };

    return data[puzzleType][index];
  }
}
