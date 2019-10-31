import 'dart:math';

class PuzzleRand {
  static int getRandomPuzzleId(String id, String puzzleType) {
    int indexNumberOnly = int.parse(id.substring(0, id.length - 1));
    int puzzleTypeLength = puzzleType.length;
    Random random =
        Random(indexNumberOnly * 10000000 + indexNumberOnly * puzzleTypeLength);
    return random.nextInt(5);
  }
}
