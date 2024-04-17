# day15

The recursion questions today are not easy, still need to clearly think about recursion conditions when doing recursion questions.

### 102 Level order traversal
Binary tree level order traversal uses queue to traversae all the tree nodes, which is a form of BFS. Level order traversal can be used to solve many leetcode questions. First initialize a queue for node traversal, and then push the head node to the queue. While queue has elements inside, first store the size of the current queue, and initialize a list called level. The size indicates how many nodes are there in the current tree level and the level list is used to store all the node values in the current level. We then use a for loop to iterate through all the node in current level (`for _ in range(size)`) to add their values to the level list and add their children back to the queue (for next level node traversal). Once the for loop is done, the level list is full and we can add the list to our result. 

Things to take care of:
1. Remember to return if root is null.
2. Only append current node's children if they exist, don't append `null` to the queue.

I find it to be a little tidieous to add code implementations as I only know one way to do level order traversal.

And this question is also related to many other binary tree quesitons, here is the list: 102, 107, 199, 637, 429, 515, 116, 117, 104, 111.

#### TODO: One thing I should do is to understand how to use DFS to solve this question.



### 226 Invert binary tree
This question is just typical recursion. Any traversal order should be fine, just reverse flip left and right childs when visiting a node. Easy question.

<details>
<summary>Python Stack based solution</summary>

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # stack based
        # inorder: left, mid, right easy to write
        stack = []
        cur = root
        while cur or stack:
            if cur:
                stack.append(cur)
                # if cur.right: stack.append(cur.right)
                if cur.left: stack.append(cur.left)
                cur = cur.left
            else:
                cur = stack.pop()
                if cur.right: stack.append(cur.right)
                cur.left, cur.right = cur.right, cur.left
                # TODO: don't understand why here is cur.right, cur.left and right are switched in this case?
                cur = cur.right
        
        return root
```
</details>

#### TODO: I can try using BFS to solve this question the next time and understand the stack based solution to replace recursion. 


### 101. Symmetric tree

Checking if a tree is symmetric boils down to checking if the left and right sub-tree of the tree is symmetric. The important part is comparing two trees are symmetric.
1. Both root has to exist
2. Both root value has to be the same
3. Inside: the right sub-tree of the left node has to be symmetric to the left sub-tree of the right node (recursively call the compare function, this recursive thought is a little counter intuitive).
4. Outside: the left sub-tree of the left node has to be symmetric to the right sub-tree of the right node.
The tree is symmetric only if all those conditions are satisfied.

<details>
<summary>code</summary>
</details>

#### TODO: try using BFS to do the comparison the next time.

# Conclusion
