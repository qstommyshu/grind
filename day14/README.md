# day14

Started binary tree today.

### Binary search preorder traversal, inorder traversal and post order traversal
Tried three different types of methods for each traversal. Did not understand the stack based traversal too well yet.

The recursive traversal is just basic recursion and directly access global variables. Need to clearly think about the recursion terminate condition.

<details>
<summary>Python Recursion Solution</summary>

```Python
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        res = []

        def traverse(cur) -> None:
            if not cur:
                return
            traverse(cur.left)
            res.append(cur.val)
            traverse(cur.right)

        traverse(root)
        return res

```
</details>

<details>
<summary>Python Stack Solution 1</summary>

```Python
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        res = []

        def traverse(cur) -> None:
            if not cur:
                return
            traverse(cur.left)
            res.append(cur.val)
            traverse(cur.right)

        traverse(root)
        return res

```
</details>

The idea of the first stack based inorder traversal solution is to push nodes in reversed inorder (mid, left, mid, left all the way to the left end). Then pop out nodes and push right child of the node back to the stack. This is similar to the idea of using a stack to do DFS. However, the code style is very different for stack based preorder and post order traversal.

<details>
<summary>Python Stack Based Inorder Traversal Solution 1</summary>

```Python
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        # TODO: 确实有点绕
        # use stack
        # order: left, cur, right
        # push node all the way to the left, then start poping
        # then push all the right nodes and start poping
        stack = []
        res = []
        cur = root
        while cur or stack:
            if cur:
                stack.append(cur)
                cur = cur.left
            # if not cur, meaning pushed to the left end
            # finished pushing all the left nodes, start poping
            else:
                cur = stack.pop()
                res.append(cur.val)
                
                cur = cur.right
        
        return res
```
</details>

Preorder traversal and post order traversal in stack based traversal method1 is pretty similar. Post order is changing the push order of the preorder traversal and then reverse the result.

<details>
<summary>Python Stack Based Preorder Traversal Solution 1</summary>

```Python
class Solution:
    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        # using stack
        if not root:
            return []
        res = []
        stack = []
        stack.append(root)
        while stack:
            cur = stack.pop()
            res.append(cur.val)
            
            if cur.right:
                stack.append(cur.right)
            if cur.left:
                stack.append(cur.left)
        return res
        
```
</details>

<details>
<summary>Python Stack Based Postorder Traversal Solution 1</summary>

```Python
class Solution:
    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        # using stack
        if not root:
            return []
        res = []
        stack = []
        stack.append(root)
        while stack:
            cur = stack.pop()
            res.append(cur.val)
            
            if cur.left:
                stack.append(cur.left)
            if cur.right:
                stack.append(cur.right)
        res.reverse()
        return res
        
```
</details>

### TODO: add unified traversal version

# Conclusion
Binary tree is a specific type of graph. It is very important to remember how to properly write recursion program. 
1. Think about recursion program signature
2. Think about terminate condition (base case)
3. Think about recursion logic (induction step)

Also, it is quite challenging to write recursion program using stack, good for logic practice.
