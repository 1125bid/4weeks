class Solution {
  String reverseVowels(String s) {
    // 모음 리스트
    final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};

    // 문자열을 리스트로 변환해 수정 가능하게 만듬
    List<String> chars = s.split('');

    // 투 포인터 방식으로 앞에서와 뒤에서 모음을 찾아 교체
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      // 왼쪽에서 모음을 찾음
      while (left < right && !vowels.contains(chars[left])) {
        left++;
      }

      // 오른쪽에서 모음을 찾음
      while (left < right && !vowels.contains(chars[right])) {
        right--;
      }

      // 두 모음을 교환
      if (left < right) {
        String temp = chars[left];
        chars[left] = chars[right];
        chars[right] = temp;

        left++;
        right--;
      }
    }

    // 리스트를 다시 문자열로 변환
    return chars.join('');
  }
}
