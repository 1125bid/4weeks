List<int> countBits(int n) {
  List<int> dp = List.filled(n + 1, 0);

  for (int i = 1; i <= n; i++) {
    dp[i] = dp[i >> 1] + (i & 1);
    //dp[i >> 1]==dp[i ~/ 2] 자릿수를 2로 나눈몫
    // (i & 1)==(i % 2) i를 2로 나눈 나머지
  }

  return dp;
}
