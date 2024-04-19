# day17

More binary tree... I figured that that binary tree recursion problems are mostly similar its traversal method (preorder, inorder, postorder traversal, etc...). But the actual recursion conditions are still quite different, there is no one template for all kind of thing.

### 110. Balanced Binary Tree
This is still a recursion problem, the main point of this question is the height and balanced. Since height is a very critical part of this question, the recursion part needs to involves some kinds of height calculation. And we also need to indicate if the tree is balanced in some way. Therefore, we can use recusion to get the height of the binary tree, and return -1 if the height of a sub-tree differs more than 1 (we know this whole tree is not a balanced binary tree at this point). Any further calculation is in fact not needed.

The recursion part is not bad, this question can be solved easily as long as the data representation is found.

### 257. Binary Tree Paths
This question is a small introduction to backtracking. Backtracking means when a specific step of recursion is finished, we need to revert back to the original state and try another path. Here we need to use a list called path to store all the elements we visit along this path, and append the path to the result when we hit a leaf node. When this recursion is done, we need to pop out the previous node we checked so that the state of the `path` variable is reverted back. 

I can also do this question without using backtracking, but it uses some uncessary space.

### 404. Sum of Left Leaves
This question is just a regular binary tree traversal question, just the terminate condition is a little different. We just need to check if a leave is left leaf. And the sum of a sub-tree's left leaf sum is the left leaf sum of the left sub-tree + the left leaf sum of the right sub-tree. 

# Conclusion
DFS question still requires some practice. Still, need to clearly think about 1. The signature of the function and what each input/output represents. 2. recursion terminate condition 3. recursion step. I feel like this just eventually boilds down to mathmatical induction and some kind of modelling. 

I can see that I'm growing, I only need some small hint and I can solve a question myself now.

I feel like the point is to really read the question, and write down what information we can retrieve from the question. Then slowly figure the answer out from what I write down. Need to do this over and over until I become a better problem solver.