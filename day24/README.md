# day24

Today is the start of backtracking algorithm, it is not easy to wrap my head around actually. I did some other review questions, and I also learned that python slice is just creating a copy of a list. 

# TODO: Also, I need to figure out how python variable works for recursion...


### General Idea of backtracking
The general idea of backtracking is to enumerate all the possibilities, it is similar to brutal force but can do something that is not able to do trivially using brutal force and can be optimized. Backtracking is usally associate with recursion, but with a step "reseting" the state back in order to try another possiblity.

Here is backtracking code template:

```Python
void backtracking(params) {
    if (base case) {
        store result;
        return;
    }

    for (width of the N-ary treee) {
        do something to current node;
        backtracking(params with different state); // recursion
        backtrack (reset state)
    }
}
```
Backtracking code can also be think of as N-ary tree traversal, where the `for loop` contributes to the width of the N-ary tree and the recursion contributes to the depth of the N-ary tree.

Backtracking with pruning is a smart way of brutal force, but it takes into a lot of consideration. 

In my opinion, backtracking is much harder than binary tree recursion.

### 77. Combinations
This question can be done by nesting `for` loops when `k` is small. However, when `k` becomes larger, this is not possible anymore. So here comes another benefit of backtracking. It allows programer to compute aribitrary depth of for loops.

The question set is similar to the question `pathSum`, and that question uses backtracking as well. We need to first set up a `result` list to store the final result and a `path` list to store intermediate small results.

It is a bit harder to know the parameters in backtracking questions, so we should think about the logic first and then work on input and output parameters. But for this question, we can just put `len(self.path) == k` as the base case. Then, loop through the from `startIndex` to `n` (width of the tree) to create the first level of our N-ary tree. In the for loop, we append the value `i` and make sure to pop our value `i` so that the initial state before and after the for loop is the same. Between this two statement, we our recursion step to go further down to the tree. Our startIndex paramter here needs to be `i+1` as we don't want repetitive numbers. 

For pruning, we need to think of the cases where we don't need traversal anymore. For `n=4, k=4`, if we only have one value in our path and the starting index is 3, it is not possible that we can reach `len(self.path) == k` in this case. All the values will be append to the path and then discarded. Here we can calculate such a number, and we can just stop when reaching this number in the for loop, the remaning calculations are just meaning less.

I know what I said here is pretty shit, but anyways, it is just for me to clear up my thoughts.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def combine(self, n: int, k: int) -> List[List[int]]:
        # backtracking recursion
        # recursion: backtrack, res = [], combinations = []
        # sig: input: n, k; return: None
        # base case: if i > n: 

        # backtracking template
        # backtracking(n, k, start):
        # base condition: if len(path) == k: add to res
        # for startIdx in range(n):
        # backtracking(n, k, startIdx)
        # path.pop()

        self.res = []
        self.path = []

        def backtracking(n, k, startIdx):
            # self.path.append(startIdx)

            if len(self.path) == k: 
                self.res.append(self.path.copy())
                return
            
            # left closed, right open
            # because start index is already appened to path

            # for loop is for the width of the recursion tree
            # TODO: pruning
            # number we already have: len(self.path)
            # number we need: k - len(self.path)
            # max number: n 
            # max start number that we still have enough number we need: n - (k - len(self.path)) + 1
            # what is that + 1 for ? Think about an example, when n = 4, k = 4, len(self.path) = 0
            # for open interval: n - (k - len(self.path)) + 1 + 1
            for i in range(startIdx, n - (k - len(self.path)) + 2):
            # for i in range(startIdx, n+1):
                # every i in for loop represent 
                self.path.append(i)
                # every backtrack step will add an element to path
                backtracking(n, k, i+1)
                # backtrack step
                self.path.pop()
                    
        backtracking(n, k, 1)

        return self.res
```
</details>

# Conclusion
Backtracking questions are not easy, need to do more questions and wrap my head around it. 