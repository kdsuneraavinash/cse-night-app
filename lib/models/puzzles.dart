class Puzzles {
  static List<String> get puzzleTypes => [
        "text",
        "photo",
        "number",
        "map",
        "hieroglyphics",
      ];

  // static String puzzleName(String puzzle) => {
  //       "text": "Luuletus",
  //       "photo": "Foto",
  //       "number": "Matemaatika",
  //       "map": "Kausta",
  //       "hieroglyphics": "Hieroglüüf",
  //     }[puzzle];

  static String puzzleName(String puzzle) => {
        "text": "The Poem",
        "photo": "Photo",
        "number": "Numbers",
        "map": "Treasure",
        "hieroglyphics": "Hieroglyphics",
      }[puzzle];

  static String textPuzzle(int index) => [
        "The one who listen will often capture\n"
            "Heavenly melodies as they float down.", // goda uda [sarcophagus]
        "It stands tall overlooking spirited moves\n"
            "And weeps for its unfulfilled destiny..", // iron auditoriam [cartouche]
        "Beware, for beyond these gates burns love,\n"
            "Brighter than the flames it's known for..", // apaya [oasis]
        "Rules are forged here, with iron voices.", // lagaan [obelisk]
      ][index];

  static String photoPuzzle(int index) => [
        "assets/puzzles/photos/0.jpg", // archi eke pitipassa para [vizier]
        "assets/puzzles/photos/1.jpg", // cs palama gawa [amun]
        "assets/puzzles/photos/2.jpg", // civil eke pitipasse wahala [senet]
        "assets/puzzles/photos/3.jpg", // boat yard eka issara civil ek pitipasse [thebes]
      ][index];

  static String numberPuzzle(int index) => [
        "assets/puzzles/numbers/0.jpg", // examhall [kinen]
        "assets/puzzles/numbers/1.jpg", // oldgym [scribe]
        "assets/puzzles/numbers/2.jpg", // boatyard [khufu]
        "assets/puzzles/numbers/3.jpg", // backgate [silt]
      ][index];

  static String mapPuzzle(int index) => [
        "assets/puzzles/maps/0.jpg", // score board ek gawa [delta]
        "assets/puzzles/maps/1.jpg", // L eka gawa [hatsheput]
        "assets/puzzles/maps/2.jpg", // mech eka ehapaththe [ramses]
        "assets/puzzles/maps/3.jpg", // civil eka pitipasse tap ek [akh]
      ][index];

  static String hieroglyphicsPuzzle(int index) => [
        "medicenter", // medicenter [akhenaten]
        "pavilion", // pavilion [akhet]
        "poshcanteen", // poshcanteen [capstone]
        "walacanteen", // walacanteen [demotic]
      ][index];
}
