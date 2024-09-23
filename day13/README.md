# day13

### Level order traversal questions
level order traversal questions is just bfs with queue, and stack can be used to do dfs without using too much memory.

I did many level order traversal variation questions to day. All uses the same idea.

<details>
<summary>102. Binary Tree Level Order Traversal</summary>

```Python
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        # edge cases: no root
        # queue
        q = [root]
        res = []
        if not root: return res
        while q:
            level = []
            for _ in range(len(q)):
                node = q.pop()
                level.append(node.val)
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
            res.append(level[:])
        return res
```
</details>

<details>
<summary>107. Binary Tree Level Order Traversal II</summary>

```Python
class Solution:
    def levelOrderBottom(self, root: Optional[TreeNode]) -> List[List[int]]:
        # just insert levels
        # edge case: no root
        res = []
        if not root: return res
        q = [root]
        while q:
            level = []
            for _ in range(len(q)):
                node = q.pop()
                level.append(node.val)
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
            res.insert(0, level[:])
        return res
```
</details>

<details>
<summary>199. Binary Tree Right Side View</summary>

```Python
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        # check the right most child to level, can insert from right to left or check level len
        res = []
        if not root: return res
        q = [root]
        while q:
            level_size = len(q)
            for i in range(level_size):
                node = q.pop()
                if i == level_size - 1:
                    res.append(node.val)
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)

        return res
```
</details>

<details>
<summary>637. Average of Levels in Binary Tree</summary>

```Python
class Solution:
    def averageOfLevels(self, root: Optional[TreeNode]) -> List[float]:
        # level order
        res = []
        if not root: return res
        q = [root]
        while q:
            level = []
            for _ in range(len(q)):
                node = q.pop()
                level.append(node.val)
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
            level_avg = sum(level) / len(level)
            res.append(level_avg)
        return res
```
</details>

<details>
<summary>429. N-ary Tree Level Order Traversal</summary>

```Python
class Solution:
    def levelOrder(self, root: 'Node') -> List[List[int]]:
        res = []
        if not root: return res
        q = [root]
        while q:
            level = []
            for _ in range(len(q)):
                node = q.pop()
                level.append(node.val)
                for child in node.children:
                    q.insert(0, child)
            res.append(level[:])
        return res

```
</details>

<details>
<summary>515. Find Largest Value in Each Tree Row</summary>

```Python
class Solution:
    def largestValues(self, root: Optional[TreeNode]) -> List[int]:
        # level order
        res = []
        if not root: return res
        q = [root]
        while q:
            largest = -float('inf')
            for _ in range(len(q)):
                node = q.pop()
                largest = max(node.val, largest)
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
            res.append(largest)
        return res
```
</details>

<details>
<summary>116. Populating Next Right Pointers in Each Node</summary>

```Python
class Solution:
    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':
        # level order
        if not root: return root
        q = [root]
        while q:
            prev = None
            for _ in range(len(q)):
                node = q.pop()
                if prev:
                    prev.next = node
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
                prev = node
        return root
```
</details>

<details>
<summary>117. Populating Next Right Pointers in Each Node II</summary>

```Python
class Solution:
    def connect(self, root: 'Node') -> 'Node':
        # level order
        if not root: return root
        q = [root]
        while q:
            prev = None
            for _ in range(len(q)):
                node = q.pop()
                if prev:
                    prev.next = node
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)
                prev = node

        return root
```
</details>

<details>
<summary>104. Maximum Depth of Binary Tree</summary>

```Python
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # level order
        res = 0
        if not root: return res
        q = [root]
        while q:
            res += 1
            for _ in range(len(q)):
                node = q.pop()
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)

        return res
```
</details>

<details>
<summary>111. Minimum Depth of Binary Tree</summary>

```Python
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        # level order
        # leaf node does not have left and right child
        level = 0
        if not root: return level
        q = [root]
        while q:
            level += 1
            for _ in range(len(q)):
                node = q.pop()
                if not node.left and not node.right: return level
                if node.left: q.insert(0, node.left)
                if node.right: q.insert(0, node.right)

        return level
```
</details>

Notes:
1. Edge cases: no root
2. bfs uses queue, so always `insert` and `pop` just like a queue, if `append` is used somewhere then unexpected behaviour might occur.
3. TODO: some question can be interesting when doing it with dfs, try that one day.


[//]: # (<details>)

[//]: # (<summary>Python Solution</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (# Definition for singly-linked list.)

[//]: # (# class ListNode:)

[//]: # (#     def __init__&#40;self, val=0, next=None&#41;:)

[//]: # (#         self.val = val)

[//]: # (#         self.next = next)

[//]: # (class Solution:)

[//]: # (    def addTwoNumbers&#40;self, l1: Optional[ListNode], l2: Optional[ListNode]&#41; -> Optional[ListNode]:)

[//]: # (        # might have carry node)

[//]: # (        # use dummy head)

[//]: # ()
[//]: # (        # might always have carry at front, also check the two pointers, if no node, assume value is 0)

[//]: # ()
[//]: # (        carry = 0)

[//]: # (        dummy = ListNode&#40;0&#41;)

[//]: # (        res = dummy)

[//]: # ()
[//]: # (        cur1 = l1)

[//]: # (        cur2 = l2)

[//]: # ()
[//]: # (        while cur1 or cur2 or carry:)

[//]: # (            if not cur1:)

[//]: # (                cur1_val = 0)

[//]: # (            else:)

[//]: # (                cur1_val = cur1.val)

[//]: # (                cur1 = cur1.next)

[//]: # (            if not cur2:)

[//]: # (                cur2_val = 0)

[//]: # (            else:)

[//]: # (                cur2_val = cur2.val)

[//]: # (                cur2 = cur2.next)

[//]: # ()
[//]: # (            total = cur1_val + cur2_val + carry)

[//]: # (            node_val = total % 10)

[//]: # (            carry = total // 10)

[//]: # (            new_node = ListNode&#40;node_val&#41;)

[//]: # (            res.next = new_node)

[//]: # ()
[//]: # (            # always remember update condition in while loop or terminate condition in recursion)

[//]: # (            res = res.next)

[//]: # (        )
[//]: # (        return dummy.next)

[//]: # (        )
[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (### 239. Sliding Window Maximum)

[//]: # (I did this question again just in case that I did not fully understand it yesterday. I can do the question, just need to make sure my logic flow is correct. Use `l` and `r` to indicate the position of the sliding window. The left most element is always the largest element in the sliding window because we clear out all smaller elements when inserting a larger element &#40;the deque is monotonic, as any element on the left hand side of a larger element is useless to keep in the deque&#41;.)

[//]: # ()
[//]: # ()
[//]: # (# Conclusion)

[//]: # (I really see that some question in the leetcode is not easy to solve myself, what I can do is probably understand the solution and make sure I can explain the solution during the interview.)

[//]: # ()
[//]: # (When it is the next time I do binary search questions, I should follow this question list, and really need to care about how to define the search interval:)

[//]: # ()
[//]: # (1. 704 [Binary Search]&#40;https://leetcode.com/problems/binary-search/&#41;)

[//]: # (2. 74 [Search a 2D Matrix]&#40;https://leetcode.com/problems/search-a-2d-matrix/&#41;)

[//]: # (3. 35 [Search Insert Position]&#40;https://leetcode.com/problems/search-insert-position/&#41;)

[//]: # (4. 34 在排序数组中查找元素的第一个和最后一个位置)

[//]: # (5. 875[Koko Eating Bananas]&#40;https://leetcode.com/problems/koko-eating-bananas/&#41;)

[//]: # (6. [153. Find Minimum in Rotated Sorted Array]&#40;https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/&#41;)

[//]: # (7. [981. Time Based Key-Value Store]&#40;https://leetcode.com/problems/time-based-key-value-store/&#41;)
