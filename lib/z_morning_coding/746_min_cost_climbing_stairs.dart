import 'dart:math';

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    int n = cost.length;
    int first = 0;
    int second = 0;

    for (int i = 0; i < n; i++) {
      int current = cost[i] + min(first, second);
      first = second;
      second = current;
    }
    return min(first, second);

    //다음과 다다음중 작은 것을 선택하는 것으로 .
  }
}
