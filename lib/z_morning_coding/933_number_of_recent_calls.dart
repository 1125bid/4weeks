import 'dart:collection';

class RecentCounter {
//멤버변수 queue 정의
  Queue<int> queue = Queue<int>();
//생성자로 초기화(속도 차이)
//생성자가 없으면 46ms
//생성자가 맨 위에 있으면 27ms
//생성자가 아래에 있으면 12ms
  RecentCounter() {}

  int ping(int t) {
    //제일 마지막 칸에t 넣기
    queue.addLast(t);
    while (queue.first < t - 3000) {
      //queue의 첫번째가 3,000 길이 범위보다 작으면
      //while문으로 조건이 해당할때 계속 반복복
      queue.removeFirst();
      //queue 첫번째 제거
    }
    //queue의 길이 생성
    return queue.length;
  }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * RecentCounter obj = RecentCounter();
 * int param1 = obj.ping(t);
 */
