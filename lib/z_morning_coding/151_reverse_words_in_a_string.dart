class Solution {
  String reverseWords(String s) {
    //
    List<String> words = s.trim().split(RegExp(r'\s+'));
    //공백을 기준으로 list로 만들고
    final reversedWords = words.reversed.join('');
    //list.reverse를 통해서 순서 역전을 시킨 후
    //list를 다시 string으로 전환
    return reversedWords;
  }
}

class Solution1 {
  String reverseWords(String s) {
    return s.trim().split(RegExp(r'\s+')).reversed.join(' ');
    ;
  }
}
