class Solution {
  bool uniqueOccurrences(List<int> arr) {
    arr.sort(); //list 오름차순정렬
    final numCount = <int, int>{};
    // for in문을 통해 같은 문자 숫자세기
    for (var e in arr) {
      numCount[e] = (numCount[e] ?? 0) + 1;
    }
    //numCount 개수 세기 {-3: 3, 0: 2, 1: 4, 10: 1}

    int listLength = numCount.values.toList().length;
    //numCount에 value값을 list로 만들기
    int setLength = numCount.values.toList().toSet().length;
    //numCount에 value값을 list로 만들기
    print(numCount);
    //해당 숫자 나오면 새로운 list를 정의하여 개수 요소에 넣기
    //list에서 중복확인
    return listLength == setLength;
  }
}
