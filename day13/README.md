# day13

Today is supposed to be a rest day, but I did some review questions anyways.

### 2. Add two numbers
This question is easy. The trick point is that when two nodes add together, it might create a carry number, and the carry number might be carried to create another carry number.

The logic of the solution is to use two loop through both linked list and get the value inside the nodes. Because the size of the two lists might be different and the uncertainty of carry bit. We need to use `while cur1 or cur2 or carry:` as the while loop condition and validate `cur1` and `cur2` inside the loop. If `cur1` or `cur2` does not exist, their values are 0. Otherwise take their value and advance the pointer. The worst case is when only carry bit exist and the result node value is just the carry bit value. 
Still, use a dummy pointer will make your life easier at the return step.

<details>
<summary>Python Solution</summary>

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        # might have carry node
        # use dummy head

        # might always have carry at front, also check the two pointers, if no node, assume value is 0

        carry = 0
        dummy = ListNode(0)
        res = dummy

        cur1 = l1
        cur2 = l2

        while cur1 or cur2 or carry:
            if not cur1:
                cur1_val = 0
            else:
                cur1_val = cur1.val
                cur1 = cur1.next
            if not cur2:
                cur2_val = 0
            else:
                cur2_val = cur2.val
                cur2 = cur2.next

            total = cur1_val + cur2_val + carry
            node_val = total % 10
            carry = total // 10
            new_node = ListNode(node_val)
            res.next = new_node

            # TODO: always remember update condition in while loop or terminate condition in recursion
            res = res.next
        
        return dummy.next
        
```
</details>

### 239. Sliding Window Maximum
I did this question again just in case that I did not fully understand it yesterday. I can do the question, just need to make sure my logic flow is correct. Use `l` and `r` to indicate the position of the sliding window. The left most element is always the largest element in the sliding window because we clear out all smaller elements when inserting a larger element (the deque is monotonic, as any element on the left hand side of a larger element is useless to keep in the deque).


# Conclusion
I really see that some question in the leetcode is not easy to solve myself, what I can do is probably understand the solution and make sure I can explain the solution during the interview.