# Day03

Today's content is about linked list, I've done this part before in one of the course, so it is easy to pick up. 

1. One thing I learned that it is much easier to use dummy pointer you need to modify the head pointer. Moving head, remove node in the head pointer, etc.
2. When you need to check `cur.next.next`, you want to make sure `cur.next != null`.

## 203. Remove Linked List Elements
My initial thought is to use while loop to detele all the occurance of a certain value, but then I realize that I need to account the condition when head needs to be removed as well. 
This solution is not the most elegent as it is not the most generalized.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        # use while
        # use virtual head node
        # edge cases: 1 node, no node, head node, last node remove
        # TODO: did not catch continuous target case
        node = ListNode()
        dummy_head = node
        dummy_head.next = head
        cur = node
        # check cur and cur.next is to accommodate last node removal
        while cur:
            while cur.next and cur.next.val == val:
                cur.next = cur.next.next
            cur = cur.next

        return dummy_head.next
```
</details>

Notes:
1. Be careful of edge cases, like: no head, modifying head node, modifying the last node, etc.
2. Dummy node can make your like much easier in linked-list questions.

## 707. Design Linked List
Moving pointers between linked list is not easy. I failed multiple times on this quesiton. Still, `dummy_head` is your best friend, otherwise it is hard to keep track of all different conditions.

Solution V1: monitoring size
<details>
<summary>Python Solution</summary>

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
</details>

Solution V2: does not monitor size
<details>
<summary>Python Solution</summary>

```Python
class Node:
    def __init__(self, val = 0):
        self.val = val
        self.next = None

class MyLinkedList:

    def __init__(self):
        self.head = None

    # TODO: edge case, when there is no head, get at the end
    def get(self, index: int) -> int:
        if not self.head: return -1

        cur = self.head
        for _ in range(index):
            # TODO: was using if cur, but should use if cur.next
            if cur.next: cur = cur.next
            else: return -1

        return cur.val

    def addAtHead(self, val: int) -> None:
        self.addAtIndex(0, val)
        return
        
    # Edge case: if list has no element
    def addAtTail(self, val: int) -> None:
        new_node = Node(val)
        if not self.head:
            self.head = new_node
            return

        dummy = Node()
        dummy.next = self.head
        cur = dummy
        while cur and cur.next:
            cur = cur.next
        cur.next = new_node
        return


    # edge case: no head(self.head), add at the end, index == len(list)
    def addAtIndex(self, index: int, val: int) -> None:
        new_node = Node(val)
        if index == 0:
            new_node.next = self.head
            self.head = new_node
            return

        dummy = Node()
        dummy.next = self.head
        cur = dummy
        for _ in range(index):
            if cur and cur.next: cur = cur.next
            else: return
        temp = cur.next

        cur.next = new_node
        new_node.next = temp
        return

    # same cases as addAtIndex
    def deleteAtIndex(self, index: int) -> None:
        if index < 0 or not self.head: return
        # case head exists
        if index == 0:
            self.head = self.head.next
            return

        # delete at end
        dummy = Node()
        dummy.next = self.head
        cur = dummy
        for _ in range(index):
            if cur and cur.next: cur = cur.next
            else: return
        if cur.next: cur.next = cur.next.next
        return
```
</details>

Notes:
1. Need to have clear logic, and think about edge cases before coding!

## 206. Reverse Linked List
This is the most cliche question ever in the stereotype of programmer. Yet I still didn't get it in one shot lol.
The point of this quesiton is remember to use a variable to store any node that we might lost the reference to, when manipulating the linked list. 
There are three variables I need to keep track of: prev, cur, temp(nxt), cur is for traversal, prev and temp are the nodes that we will lose reference of.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # use temp or dummy head?
        # edge cases: one node, no head
        # prev and cur are initially dislinked
        cur = head
        prev = None
        while cur:
            temp = cur.next
            cur.next = prev
            prev = cur
            cur = temp
        # because when cur loop to the end of the list it will be None
        return prev
```
</details>

Notes:
1. Simulate it in your head before coding!
2. `cur` and `temp` are always dis-linked, `temp` is just a technique to move forward without losing necessary information. The relationship between `prev` `cur` is the one you need to manipulate with.
3. Think about the case when your operation reaches the end of the linked-list.
4. TODO: think about why: `cur` and `temp` does not need to be connected, but in 24 it needs to be connected.
