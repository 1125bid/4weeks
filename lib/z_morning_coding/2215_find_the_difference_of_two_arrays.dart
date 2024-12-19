class Solution {
  List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
    Set<int> set1 = Set.from(nums1);
    Set<int> set2 = Set.from(nums2);

    List<int> result1 = [];
    List<int> result2 = [];

    set1.forEach((num) {
      if (!set2.contains(num)) result1.add(num);
    });

    set2.forEach((num) {
      if (!set1.contains(num)) result2.add(num);
    });

    return [result1, result2];
  }
}
