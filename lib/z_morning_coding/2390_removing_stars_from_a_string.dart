class Solution {
  String removeStars(String s) {
    //stack을 List로 정의 removeLast, add 쓰기위해서서
    List<String> stack = [];
    //문자열 반복
    for (int i = 0; i < s.length; i++) {
      //stack에 문자열 추가
      stack.add(s[i]);
      // *이 문자열에 있는지 확인
      if (s[i] == '*') {
        // * 을 제거
        stack.removeLast();
        // *전 문자열을 제거
        stack.removeLast();
      }
    }
    //string으로 변환
    return stack.join();
  }
}

class Solution1 {
  String removeStars(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '*') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(s[i]);
      }
    }
    return stack.join();
  }
}
