# Day04

Today is more about linked list. I think my understanding about linked list is a little deeper now.

## 24. Swap Nodes in Pairs
This is the first question today. For this question, `dummy_head` is still my best friend for linked list. 
It saved me so much trouble in manipulating the head pointer and the inconsistency of the state transition function for the first node. The overall idea is not hard, just reorganize the pointer and simulate.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # prev, cur, temp
        # dummy head
        # still reverse linked list, but temp is further
        # edge cases: no head, odd number length
        if not head: return
        dummy = ListNode()
        dummy.next = head
        prev = dummy
        cur = prev.next
        # TODO: this way the last node is disconnected when odd len
        while cur and cur.next:
            temp = cur.next.next
            prev.next = cur.next
            cur.next.next = cur
            # TODO: just need to connect cur and temp
            cur.next = temp
            prev = cur
            cur = temp

        return dummy.next
```
</details>

Notes:
1. This is an upgraded-version question from [reverse linked list](https://github.com/qstommyshu/grind/tree/main/day03). The differences are we have one more node to take care about. `temp` is `cur.next.next`, and we need to connect `cur` and `temp`. 
2. TODO: think about why: `cur` and `temp` does not need to be connected in [reverse linked list](https://github.com/qstommyshu/grind/tree/main/day03), but in this question it needs to be connected. What is the difference.

## 19. Remove Nth Node From End of List
This question is pretty easy. Still, `dummy_head` eliminates the head node removal case. The basic idea is use two pointers on linked list. Fast pointer points to `n` nodes after the `dummy_head` and slow pointer points to the `dummy_head`. The simultaneously move both the `fast` and `slow` pointer. Once the `fast` pointer reaches the end, the `slow` pointer is at the position to remove the `n`th node from the end of the list.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        # edge cases: no head, only one node, invalid n? no invalid n
        if not head: return
        dummy = ListNode()
        dummy.next = head
        fast = dummy
        for _ in range(n):
            fast = fast.next
        cur = dummy
        while fast.next:
            cur = cur.next
            fast = fast.next

        cur.next = cur.next.next

        return dummy.next
```
</details>

Notes:
1. Easy question

## 160. Intersection of Two Linked Lists
This question is also easy. We first loop through both `A` and `B` to get the length of the two linked list. And then match the starting position of the longer list head to the smaller list head. Then simultaneously loop through both of them and check if their current node are the same. If yes, return the node, otherwise they don't intersect.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
        # use set to collect all the nodes?
        # cannot check A is shorter or B is shorter, so just use A
        # edge cases: A or B is Null
        if not (headA or headB): return
        A = set()
        curA = headA
        curB = headB
        while curA:
            A.add(curA)
            curA = curA.next

        while curB:
            if curB in A:
                return curB
            curB = curB.next

        return None
```
</details>

Notes:
1. Easy question

## 142. Linked List Cycle II
There is a damn complicated solution for this question. I don't think it is possible to use this method in an interview. So I'm just sticking with a easy method, keep a set of visited nodes and check if this node appears again in the set.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def detectCycle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # use set to collect
        # edge cases: no head
        if not head: return None
        nodes = set()
        cur = head
        while cur:
            if cur in nodes:
                return cur
            else:
                nodes.add(cur)
                cur = cur.next

        return None
```

</details>

Notes:
1. Easy question, same question as above (160).