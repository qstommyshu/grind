# day 14

## 226. Invert Binary Tree

#### Logic:
Once the two children node of a binary tree is inverted, then a binary tree is inverted. 

<details>
<summary>Python Recursion Solution</summary>

```Python
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # invert from bot to top? because if invert then traverse, we are no longer at
        # the original node

        if not root: return
        root.left, root.right = root.right, root.left
        self.invertTree(root.left)
        self.invertTree(root.right)

        return root
```
</details>

<details>
<summary>Python Stack Solution</summary>

```Python
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # invert from bot to top? because if invert then traverse, we are no longer at
        # the original node

        stack = [root]
        while stack:
            node = stack.pop()
            node.left, node.right = node.right, node.left

            if node.right: stack.append(node.right)
            if node.left: stack.append(node.left)

        return root
```
</details>

#### Notes:
1. For anything b-tree question, first thing to think should be recursion.

## 101. Symmetric Tree

#### Logic:
Checking if a tree is symmetric is the same as checking if its children is mirrored, checking if two trees are mirrored needs to compare the outer layer and inner layer. 

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        if not root: return True

        # dfs
        # compare if the two child node is symmetric

        def isMirrored(left, right):
            if not left and not right: return True
            if left and right and left.val == right.val:
                return isMirrored(left.right, right.left) and isMirrored(right.right, left.left)
            return False

        return isMirrored(root.left, root.right)
```
</details>

#### Notes:
1. Level order traversal does not work on this question.

## 104. Maximum Depth of Binary Tree

#### Logic: 
Base case: when there is no root. Induction case: when there is at least 1 node.

<details>
<summary>Python BFS Solution</summary>

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
<summary>Python Pruned DFS Solution</summary>

```Python
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # dfs
        if not root: return 0
        return max(self.maxDepth(root.left), self.maxDepth(root.right)) + 1
```
</details>

<details>
<summary>Python Raw DFS Solution</summary>

```Python
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # dfs
        if not root: return 0
        def getMaxDepth(node):
            # base case: leaf node
            if node and not node.left and not node.right: return 1
            left_max_depth = getMaxDepth(node.left) if node.left else 0
            right_max_depth = getMaxDepth(node.right) if node.right else 0

            return 1 + max(left_max_depth, right_max_depth)

        return getMaxDepth(root)
```
</details>

#### Notes:
1. None

## 111. Minimum Depth of Binary Tree

#### Logic: 
Similar to maxDepth, expect the stopping condition is different (stop when reaches leaf node).

<details>
<summary>Python BFS Solution</summary>

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

<details>
<summary>Python Pruned DFS Solution</summary>

```Python
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        # dfs

        def getMinDepth(node):
            if not node: return 0
            left_depth = getMinDepth(node.left)
            right_depth = getMinDepth(node.right)
            if node.left and not node.right: return 1 + left_depth
            if node.right and not node.left: return 1 + right_depth
            return 1 + min(left_depth, right_depth)

        return getMinDepth(root)
```
</details>

<details>
<summary>Python RAW DFS Solution</summary>

```Python
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        # dfs
        if not root: return 0
        def getMinDepth(node):
            # base case: leaf node
            if node and not node.left and not node.right: return 1
            # induction case: if it is not leaf node
            left_min_depth = getMinDepth(node.left) if node.left else float('inf')
            right_min_depth = getMinDepth(node.right) if node.right else float('inf')

            return 1 + min(left_min_depth, right_min_depth)

        return getMinDepth(root)
```
</details>

#### Notes:
1. The dfs solution idea is similar to `104. Maximum Depth of Binary Tree`. The different part is when a node only have one child, `minDepth` of the node is not determined by the `NULL` node. Compare the RAW Solutions above to see what I mean here.


[//]: # (# day14)

[//]: # ()
[//]: # (Started binary tree today.)

[//]: # ()
[//]: # (### Binary search preorder traversal, inorder traversal and post order traversal)

[//]: # (Tried three different types of methods for each traversal. Did not understand the stack based traversal too well yet.)

[//]: # ()
[//]: # (The recursive traversal is just basic recursion and directly access global variables. Need to clearly think about the recursion terminate condition.)

[//]: # ()
[//]: # (<details>)

[//]: # (<summary>Python Recursion Solution</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (class Solution:)

[//]: # (    def inorderTraversal&#40;self, root: Optional[TreeNode]&#41; -> List[int]:)

[//]: # (        res = [])

[//]: # ()
[//]: # (        def traverse&#40;cur&#41; -> None:)

[//]: # (            if not cur:)

[//]: # (                return)

[//]: # (            traverse&#40;cur.left&#41;)

[//]: # (            res.append&#40;cur.val&#41;)

[//]: # (            traverse&#40;cur.right&#41;)

[//]: # ()
[//]: # (        traverse&#40;root&#41;)

[//]: # (        return res)

[//]: # ()
[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (<details>)

[//]: # (<summary>Python Stack Solution 1</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (class Solution:)

[//]: # (    def inorderTraversal&#40;self, root: Optional[TreeNode]&#41; -> List[int]:)

[//]: # (        res = [])

[//]: # ()
[//]: # (        def traverse&#40;cur&#41; -> None:)

[//]: # (            if not cur:)

[//]: # (                return)

[//]: # (            traverse&#40;cur.left&#41;)

[//]: # (            res.append&#40;cur.val&#41;)

[//]: # (            traverse&#40;cur.right&#41;)

[//]: # ()
[//]: # (        traverse&#40;root&#41;)

[//]: # (        return res)

[//]: # ()
[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (The idea of the first stack based inorder traversal solution is to push nodes in reversed inorder &#40;mid, left, mid, left all the way to the left end&#41;. Then pop out nodes and push right child of the node back to the stack. This is similar to the idea of using a stack to do DFS. However, the code style is very different for stack based preorder and post order traversal.)

[//]: # ()
[//]: # (<details>)

[//]: # (<summary>Python Stack Based Inorder Traversal Solution 1</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (class Solution:)

[//]: # (    def inorderTraversal&#40;self, root: Optional[TreeNode]&#41; -> List[int]:)

[//]: # (        # TODO: 确实有点绕)

[//]: # (        # use stack)

[//]: # (        # order: left, cur, right)

[//]: # (        # push node all the way to the left, then start poping)

[//]: # (        # then push all the right nodes and start poping)

[//]: # (        stack = [])

[//]: # (        res = [])

[//]: # (        cur = root)

[//]: # (        while cur or stack:)

[//]: # (            if cur:)

[//]: # (                stack.append&#40;cur&#41;)

[//]: # (                cur = cur.left)

[//]: # (            # if not cur, meaning pushed to the left end)

[//]: # (            # finished pushing all the left nodes, start poping)

[//]: # (            else:)

[//]: # (                cur = stack.pop&#40;&#41;)

[//]: # (                res.append&#40;cur.val&#41;)

[//]: # (                )
[//]: # (                cur = cur.right)

[//]: # (        )
[//]: # (        return res)

[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (Preorder traversal and post order traversal in stack based traversal method1 is pretty similar. Post order is changing the push order of the preorder traversal and then reverse the result.)

[//]: # ()
[//]: # (<details>)

[//]: # (<summary>Python Stack Based Preorder Traversal Solution 1</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (class Solution:)

[//]: # (    def preorderTraversal&#40;self, root: Optional[TreeNode]&#41; -> List[int]:)

[//]: # (        # using stack)

[//]: # (        if not root:)

[//]: # (            return [])

[//]: # (        res = [])

[//]: # (        stack = [])

[//]: # (        stack.append&#40;root&#41;)

[//]: # (        while stack:)

[//]: # (            cur = stack.pop&#40;&#41;)

[//]: # (            res.append&#40;cur.val&#41;)

[//]: # (            )
[//]: # (            if cur.right:)

[//]: # (                stack.append&#40;cur.right&#41;)

[//]: # (            if cur.left:)

[//]: # (                stack.append&#40;cur.left&#41;)

[//]: # (        return res)

[//]: # (        )
[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (<details>)

[//]: # (<summary>Python Stack Based Postorder Traversal Solution 1</summary>)

[//]: # ()
[//]: # (```Python)

[//]: # (class Solution:)

[//]: # (    def preorderTraversal&#40;self, root: Optional[TreeNode]&#41; -> List[int]:)

[//]: # (        # using stack)

[//]: # (        if not root:)

[//]: # (            return [])

[//]: # (        res = [])

[//]: # (        stack = [])

[//]: # (        stack.append&#40;root&#41;)

[//]: # (        while stack:)

[//]: # (            cur = stack.pop&#40;&#41;)

[//]: # (            res.append&#40;cur.val&#41;)

[//]: # (            )
[//]: # (            if cur.left:)

[//]: # (                stack.append&#40;cur.left&#41;)

[//]: # (            if cur.right:)

[//]: # (                stack.append&#40;cur.right&#41;)

[//]: # (        res.reverse&#40;&#41;)

[//]: # (        return res)

[//]: # (        )
[//]: # (```)

[//]: # (</details>)

[//]: # ()
[//]: # (### TODO: add unified traversal version)

[//]: # (One of the most important point to understand the unified binary search tree traversal is the `Null` label. Any node pushed after a `Null` label is temporary, they are just path to get their nodes. Therefore, once we see `Null`, we started to add node value to result.)

[//]: # ()
[//]: # (# Conclusion)

[//]: # (Binary tree is a specific type of graph. It is very important to remember how to properly write recursion program. )

[//]: # (1. Think about recursion program signature)

[//]: # (2. Think about terminate condition &#40;base case&#41;)

[//]: # (3. Think about recursion logic &#40;induction step&#41;)

[//]: # ()
[//]: # (Also, it is quite challenging to write recursion program using stack, good for logic practice.)
