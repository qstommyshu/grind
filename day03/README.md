# Day03

Today's content is about linked list, I've done this part before in one of the course, so it is easy to pick up. 

1. One thing I learned that it is much easier to use dummy pointer you need to modify the head pointer. Moving head, remove node in the head pointer, etc.
2. When you need to check `cur.next.next`, you want to make sure `cur.next != null`.

## 203. Remove Linked List Elements
My initial thought is to use while loop to detele all the occurance of a certain value, but then I realize that I need to account the condition when head needs to be removed as well. 
This solution is not the most elegent as it is not the most generalized.
```Python
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        if head == None:
            return
        while head and head.val == val:
            head = head.next
        cur = head
        while cur and cur.next:
            if cur.next.val == val:
                cur.next = cur.next.next
            else:
                cur = cur.next
        
        return head
```

The solution using dummy node is better because we don't need to treat head as a special condition anymore:
```Python
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        dummy_head = ListNode(0)
        dummy_head.next = head
        cur = dummy_head
        while cur.next:
            if cur.next.val == val:
                cur.next = cur.next.next
            else:
                cur = cur.next
        return dummy_head.next
```

## 707. Design Linked List
Moving pointers between linked list is not easy. I failed multiple times on this quesiton. Still, `dummy_head` is your best friend, otherwise it is hard to keep track of all different conditions.

```Python
class Node:
    def __init__(self, val = 0):
        self.val = val
        self.next = None

class MyLinkedList:

    def __init__(self):
        self.dummy_head = Node(0)
        self.size = 0

    def get(self, index: int) -> int:
        if index >= self.size or index < 0:
            return -1
        cur = self.dummy_head
        for i in range(index+1):
            cur = cur.next
        return cur.val

    def addAtHead(self, val: int) -> None:
        new_head = Node(val)
        new_head.next = self.dummy_head.next
        self.dummy_head.next = new_head
        self.size += 1

    def addAtTail(self, val: int) -> None:
        new_tail = Node(val)
        cur = self.dummy_head
        for _ in range(self.size):
            cur = cur.next
        cur.next = new_tail
        self.size += 1

    def addAtIndex(self, index: int, val: int) -> None:
        if index > self.size:
            return
        if index == 0:
            self.addAtHead(val)
            return
        
        new_node = Node(val)
        cur = self.dummy_head
        for _ in range(index):
            cur = cur.next
        new_node.next = cur.next
        cur.next = new_node
        self.size += 1

    def deleteAtIndex(self, index: int) -> None:
        if index >= self.size:
            return
        if index == 0:
            # delete head condition
            self.dummy_head.next = self.dummy_head.next.next
            self.size -= 1
            return

        cur = self.dummy_head
        for _ in range(index):
            cur = cur.next
        cur.next = cur.next.next
        self.size -= 1
```

206. Reverse Linked List
This is the most cliche question ever in the stereotype of programmer. Yet I still didn't get it in one shot lol.
The point of this quesiton is remember to use a variable to store any node that we might lost the reference to, when manipulating the linked list. 
There are three variables I need to keep track of: prev, cur, temp(nxt), cur is for traversal, prev and temp are the nodes that we will lose reference of.

```Python
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        cur = head
        prev = None
        while cur:
            temp = cur.next
            cur.next = prev
            prev = cur
            cur = temp
        return prev
```

