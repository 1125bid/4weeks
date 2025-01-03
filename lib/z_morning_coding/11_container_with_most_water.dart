import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    //min(height[i],height[j])*(i-j)의 최대값
    int left = 0;
    int right = height.length - 1;
    int maxArea = 0;
    while (left < right) {
      int currentArea = min(height[left], height[right]) * (right - left);
      maxArea = max(currentArea, maxArea);
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }
    return maxArea;
  }
}
