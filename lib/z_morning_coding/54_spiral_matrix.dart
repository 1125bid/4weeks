class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> result = [];
    int top = 0;
    int left = 0;
    int bottom = matrix.length - 1;
    int right = matrix[0].length - 1;
    while (top >= bottom && right >= left) {
      //왼쪽에서 오른쪽으로 이동
      for (int i = left; i <= right; i++) {
        result.add(matrix[top][i]);
      }
      top++; //최상단 행 폐쇄
      //위에서 아래로 이동
      for (int i = top; i <= bottom; i++) {
        result.add(matrix[right][i]);
      }
      right--; //최우단 열 폐쇄
      //오른쪽에서 왼쪽으로 이동
      if (bottom >= top) {
        for (int i = right; i >= left; i--) {
          result.add(matrix[bottom][i]);
        }
        bottom++; //최하단 행 폐쇄
      }
      //아래에서 위로 이동
      if (right >= left) {
        for (int i = bottom; i >= top; i--) {
          result.add(matrix[i][right]);
        }
        left++; //최좌단 열폐쇄
      }
    }
    return result;
  }
}
