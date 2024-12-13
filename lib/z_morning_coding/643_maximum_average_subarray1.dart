import 'dart:math';

class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int sum = 0;
    int n = nums.length;
    int maxSum = 0;

    for (int i = 0; i < k; i++) {
      sum += nums[i];
    }
    maxSum = sum;
    for (int i = k; i < n; i++) {
      sum = sum - nums[i - k] + nums[i];
      maxSum = max(maxSum, sum);
    }
    return maxSum / k;
  }
}
