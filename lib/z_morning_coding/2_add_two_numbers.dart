class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode dummy = ListNode(0); // 결과를 담을 더미 노드
  ListNode current = dummy; // 현재 작업 중인 노드
  int carry = 0; // 자리 올림값 저장

  while (l1 != null || l2 != null || carry != 0) {
    int x = l1?.val ?? 0; // l1의 값, 없으면 0
    int y = l2?.val ?? 0; // l2의 값, 없으면 0
    int sum = x + y + carry;

    carry = sum ~/ 10; // 올림값 계산
    current.next = ListNode(sum % 10); // 현재 자리수 값 노드 생성
    current = current.next!;

    // l1과 l2를 다음 노드로 이동
    l1 = l1?.next;
    l2 = l2?.next;
  }

  return dummy.next; // 결과 리스트 반환 (더미의 다음 노드)
}
