class Solution {
  int singleNumber(List<int> nums) {
    int result = 0;
    for (int num in nums) {
      result = result ^ num;
      print("$result");
    }
    return result;
  }

  int singleNumber1(List<int> nums) {
    // for문으로
    Set<int> set = {};
    for (int num in nums) {
      if (set.contains(num)) {
        set.remove(num);
      } else {
        set.add(num);
      }
    }
    return set.first;
  }

  int singleNumber2(List<int> nums) {
    var numCount = {};
    nums.forEach((num) {
      numCount[num] = (numCount[num] ?? 0) + 1;
    });
    return numCount.keys.firstWhere((key) => numCount[key] == 1);
  }
}
