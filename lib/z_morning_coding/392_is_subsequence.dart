class Solution {
  bool isSubsequence(String s, String t) {
    if (s.isEmpty) return true;
    int num = 0;

    for (int i = 0; i < t.length && num < s.length; i++) {
      if (t[i] == s[num]) {
        num++;
      }
    }
    return num == s.length;
  }
}
