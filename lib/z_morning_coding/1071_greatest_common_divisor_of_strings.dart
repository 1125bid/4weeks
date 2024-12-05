// For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).

// Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.
class Solution {
  String gcdOfStrings(String str1, String str2) {
    int len1 = str1.length;
    int len2 = str2.length;
    int gcd(len1, len2) {
      if (len1 < len2) {
        int tem = len1;
        len1 = len2;
        len2 = tem;
      }
      while (len2 != 0) {
        int n = len1 % len2;
        len1 = len2;
        len2 = n;
      }
      return len1;
    }

    if (str1 + str2 != str2 + str1) {
      return "";
    } else
      return str1.substring(0, gcd(len1, len2));
  }
}
