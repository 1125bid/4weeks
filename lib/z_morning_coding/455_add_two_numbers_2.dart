// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverse(ListNode? head) {
    ListNode? prev = null;
    while (head != null) {
      ListNode? next = head.next;
      head.next = prev;
      prev = head;
      head = next;
    }
    return prev;
  }

  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0); //결과를 저장할 가상 헤드 노드
    ListNode? current = dummy; //현재 노드를 가리키는 포인터
    int carry = 0;

    while (l1 != null || l2 != null || carry != 0) {
      int sum = carry;

      if (l1 != null) {
        sum += l1.val;
        l1 = l1.next;
      }
      if (l2 != null) {
        sum += l2.val;
        l2 = l2.next;
      }
      carry = sum ~/ 10;
      current?.next = ListNode(
          sum % 10); //current.next가 현재 자릿수(0부터 시작했기 때문에) sum을 10으로 나눈 나머지
      current = current?.next;
    }
    return reverse(dummy.next); //dummy== 제일 앞 [0] 값도 반환.
  }
}
