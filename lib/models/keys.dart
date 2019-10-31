class Keys {
  static String getKey(String puzzleType, int index) {
    Map<String, List<String>> data = {
      "text": [
        "sarcophagus",
        "cartouche",
        "oasis",
        "obelisk",
        "ankh",
      ],
      "photo": [
        "vizier",
        "amun",
        "senet",
        "thebes",
        "nefertiti",
      ],
      "number": [
        "kinen",
        "scribe",
        "khufu",
        "silt",
        "delta",
      ],
      "map": [
        "obelisk",
        "hatsheput",
        "ramses",
        "akh",
        "ba",
      ],
      "hieroglyphics": [
        "akhenaten",
        "akhet",
        "capstone",
        "demotic",
        "deshret",
      ],
    };

    return data[puzzleType][index];
  }
}
