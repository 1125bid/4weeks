class Solution {
  void moveZeroes(List<int> nums) {
    for (int i = nums.length - 1; i >= 0; i--) {
      if (nums[i] == 0) {
        nums.removeAt(i);
        nums.add(0);
      }
    }
  }
}
