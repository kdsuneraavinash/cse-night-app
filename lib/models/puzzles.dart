class Puzzles {
  static List<String> get puzzleTypes => [
        "text",
        "photo",
        "number",
        "map",
        "hieroglyphics",
      ];

  static String puzzleName(String puzzle) => {
        "text": "Luuletus",
        "photo": "Foto",
        "number": "Matemaatika",
        "map": "Kausta",
        "hieroglyphics": "Hieroglüüf",
      }[puzzle];

  static String textPuzzle(int index) => [
        "The one who listen will often capture\n"
            "Heavenly melodies as they float down.", // goda uda [sarcophagus]
        "It stands tall overlooking spirited moves\n"
            "And weeps for its unfulfilled destiny..", // iron auditoriam [cartouche]
        "Beware, for beyond these gates burns love,\n"
            "Brighter than the flames it's known for..", // apaya [oasis]
        "They say the battles fought here are the hardest,\n"
            "For the sole foe you meet here is yourself.", // lagaan [obelisk]
      ][index];

  static String photoPuzzle(int index) => [
        "assets/puzzles/photos/0.jpg", // vizier
        "assets/puzzles/photos/1.jpg", // amun
        "assets/puzzles/photos/2.jpg", // senet
        "assets/puzzles/photos/3.jpg", // thebes
      ][index];

  static String numberPuzzle(int index) => [
        "assets/puzzles/numbers/0.png", // kinen
        "assets/puzzles/numbers/1.png", // scribe
        "assets/puzzles/numbers/2.png", // khufu
        "assets/puzzles/numbers/3.png", // silt
      ][index];

  static String mapPuzzle(int index) => [
        "assets/puzzles/maps/0.jpg", // obelisk
        "assets/puzzles/maps/0.jpg", // hatsheput
        "assets/puzzles/maps/0.jpg", // ramses
        "assets/puzzles/maps/0.jpg", // akh
      ][index];

  static String hieroglyphicsPuzzle(int index) => [
        "akhenaten", // akhenaten
        "akhet", // akhet
        "capstone", // capstone
        "demotic", // demotic
      ][index];
}
