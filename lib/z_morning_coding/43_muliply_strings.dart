class Solution {
  String multiply(String num1, String num2) {
    BigInt multiply = BigInt.parse(num1) * BigInt.parse(num2);
    return multiply.toString();
  }
}
