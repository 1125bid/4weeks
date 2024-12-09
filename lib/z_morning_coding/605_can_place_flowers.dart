class Solution {
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    int count = 0;
    int length = flowerbed.length;

    for (int i = 0; i < length; i++) {
      //해당 자리 확인
      if (flowerbed[i] == 0 &&
          //왼쪽 확인
          (i == 0 || flowerbed[i - 1] == 0) &&
          //오른쪽 확인
          (i == length - 1 || flowerbed[i + 1] == 0)) {
        flowerbed[i] = 1; // 꽃을 심음
        count++; //개수 증가
        if (count >= n) {
          return true; // 충분히 많은 꽃을 심었으면 true 반환(필요 없으나 안하면 2배 느려짐)
        }
      }
    }

    return count >= n;
  }
}
