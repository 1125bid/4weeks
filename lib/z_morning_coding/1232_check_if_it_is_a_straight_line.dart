class Solution {
  bool checkStraightLine(List<List<int>> coordinates) {
    //기울기가 같은지 확인

    for (int i = 0; i < coordinates.length; i++) {
      if ((coordinates[0][1] - coordinates[1][1]) *
              (coordinates[i][0] - coordinates[0][0]) !=
          (coordinates[i][1] - coordinates[0][1]) *
              (coordinates[0][0] - coordinates[1][0])) return false;
    }
    return true;
  }
}
