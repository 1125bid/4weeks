class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    List<bool> result = [];
//리스트에서 최대값구하기
    candies.reduce(max);
//for문으로 캔디+엑스트라 캔디>=최대값
    for (int i = 0; i < candies.length; i++) {
      result.add(candies[i] + extraCandies >= candies.reduce(max));
    }
    return result;
  }
}
