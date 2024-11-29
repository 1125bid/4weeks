class Solution {
  double myPow(double x, int n) {
    if (n == 0) {
      return 1; //x^0=1
    }
    //n<0, x를 역수로 전환& n>0로 전환
    if (n < 0) {
      x = 1 / x;
      n = -n;
    }
    //x^(n/2)정의
    double halfPow = myPow(x, n ~/ 2);
    //n이짝수이면 halfPow^2, n이 홀수 이면 x*(halfPow^2)
    return (n.isEven) ? halfPow * halfPow : halfPow * halfPow * x;
  }
}

// class Solution {
//   double myPow(double x, int n) {
//     if (n < 0) {
//       n = -n;
//       x = 1 / x;
//     } else if (n == 0) {
//       return 1;
//     }
//     double halfPow = myPow(x, n ~/ 2);
//     return (n % 2 == 0) ? halfPow * halfPow : halfPow * halfPow * x;
//   }
// }
