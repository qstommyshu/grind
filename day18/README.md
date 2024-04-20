# day18

started to understand a little more about backtracking now, and I found an interesting issue in python. The primitive type variable that is out of a function scope cannot be directly used in function call, but varialbes like list can be used this way. A workaround is to make the primitive type a state in the class. 

For example, this code is fine (the variable out of scope is `path` and `res`, which are lists):
```Python
class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> List[List[int]]:
        # this is just my answer for 112
        path = []
        res = []

        if not root: return res
        def find_path(cur):
            path.append(cur.val)
            if not (cur.left or cur.right): 
                if sum(path) == targetSum:
                    # append path or path.copy?
                    res.append(path.copy())
            
            if cur.left:
                find_path(cur.left)
                path.pop()
            
            if cur.right:
                find_path(cur.right)
                path.pop()
        
        find_path(root)
        return res
```

but code like this have error (the variable `diameter` is primitive types, and function cannot directly capture its value):

```Python
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        # calculate height of left and right
        # the diameter = left_height + right_height
        # recursion: get_diameter
        # signature: input: cur, output: height (int)
        # terminate condition: if not cur.left and not cur.right: return 0
        # recursive condition: left_height = 1 + max(get_height(cur.left), get_height(cur.right))

        # need to get height and calculate diameter when hitting a leaf node, and then update the diameter

        diameter = 0
        # if not root: return diameter

        # TODO: need to be clear about how to calculate the height of a tree, 
        # Initially tried if not (cur.left or cur.right): return 0
        def get_height(cur) -> int:
            if not cur: return 0

            l_h = get_height(cur.left)
            r_h = get_height(cur.right)

            diameter = max(l_h + r_h, diameter)
            
            return 1 + max(l_h, r_h)
        
        get_height(root)

        return diameter
```

We need to fix it like this (make `diameter` a state):
```Python
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        # calculate height of left and right
        # the diameter = left_height + right_height
        # recursion: get_diameter
        # signature: input: cur, output: height (int)
        # terminate condition: if not cur.left and not cur.right: return 0
        # recursive condition: left_height = 1 + max(get_height(cur.left), get_height(cur.right))

        # need to get height and calculate diameter when hitting a leaf node, and then update the diameter

        self.diameter = 0
        # if not root: return self.diameter

        # TODO: need to be clear about how to calculate the height of a tree, 
        # Initially tried if not (cur.left or cur.right): return 0
        def get_height(cur) -> int:
            if not cur: return 0

            l_h = get_height(cur.left)
            r_h = get_height(cur.right)

            self.diameter = max(l_h + r_h, self.diameter)
            
            return 1 + max(l_h, r_h)
        
        get_height(root)

        return self.diameter
```

### 543. Diameter of Binary Tree
This question is very similar to `Max Depth of Binary Tree`, except we need to udpate the value diameter inside the `get_height` recursive call. The tricky point of this question is to clearly think about how to calcualte the diameter, or more precisely, how to calculate the height of the tree. I initially made a mistake of returning 0 at the leaf level, but we should return 0 when there is no node. The tree height of returning 0 when there is no node is the number of nodes in the longest path, but we don't use that number to calculate our diameter, what we use is the height of its left sub-tree and the right sub-tree.

<details>
<summary>code</summary>
</details>

### 112. Path Sum I 113. Path Sum II
112 is backtracking, remeber to reset the state when finished a recursion possibility. Updating the targetNumber is also quite interesting.

113 is also backtracking, remember to backtrack when finished trying a possiblity (pop the latest value appended to the path collection). 

### 513. Find bottom left value
This question can be done in BFS and DFS.
BFS is just level order traversal, and update the result whenever we first encounter a new level.
DFS solution uses backtracking, we need to keep track of a variable called `depth` and a `max_depth` to check if the current leaf node is at the bottom level. We need to reset the state of the depth variable everytime we finished trying a node.

# Conclusion
Found some template from these questions:
1. When question ask for something related to leaf node, then `if not (cur.left or cur.right)`
2. When question require you to try out all the possiblities, backtracking and remember to reset the backtracking state.
3. need to clearly think about recursion conditions before writing code.