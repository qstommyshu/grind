# day16

Today's question focuses on BFS, but some questions can use DFS to solve as well.

### 104. Maximum Depth of Binary Tree
DFS recursion: 
1. Think about what should be the recursion signature (takes in a current node, return a integer representing the depth of the sub-tree starting from the current node). 
2. Think about terminate condition, base case (when cur node does not exist, when there is a node, depth is 1).
3. Think about recursion condition, induction step (if cur node exist, the max depth is max(left and right child) + 1)

BFS level order traversal:
Traverse every node level by level using queue, in each level, level counter += 1. 

<details>
<summary>code</summary>
</details>

### 111. Minimum Depth of Binary Tree
The overall idea of this question is still the min depth of the binary tree is the min(leftDepth, rightDepth) + 1, but it is more tricky as we need to take into account the case when a child does not exist. When a child does not exist, we cannot use the depth of that child for calculation, otherwise, the result will always end up in 1. 

DFS recursion:
1. Signature (takes in current node, return the min depth)
2. Terminate condition (when `cur` does not exist, return 0)
3. Recursion condition (if only left node exist: return 1 + left_depth, if only right node exist: return 1 + right_depth, if both node exists: return 1 + min(left_depth, right_depth)).

BFS level order traversal:
traverse level by level, but we can stop when we see a node that does not have left child and right child, the latest leave node we see has the min depth.

### 222. Count Complete Tree Nodes
There are two cases we need to consider in this question:
1. The tree is a full binary tree.
2. The tree is not a full binary tree.

When the tree is full binary tree, we can just simply calculate the number of nodes by calculating `pow(2, tree_depth) - 1`. When tree is not a full binary tree, we need to manually count the tree nodes. However, counting the tree nodes can also be break into smaller cases, 1 + left sub-tree count + right sub-tree count. And we can use two conditions to calculate the sub-tree count as well.

So this question can be done in recursion:
1. Signature (takes in current node, return the number of nodes in current tree)
2. Terminate condition (when `cur` does not exist, return 0)
3. Recursion condition (traverse all the way to both left and right, and keep account of depth, if left depth == right depth, then it is a full binary tree. Node count is just math formula. If left depth != righ depth, then we need to go into recursion to calculate the left and right sub-tree node count)

# Conclusion
Recursion is powerful, but also quite tricky, need to clearly think about the base condition and recursion condition.