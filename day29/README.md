# day29

Catch up after the three day holiday in may. Did some more questions in backtracking and learned how to use set to prevent duplicate values in the same level. Also learned how to solve permutation problems using backtracking.

### 491. Non-decreasing Subsequences
Since this question requires subsequences, so we can't sort the original nums. And the given nums might also contain duplicates, we can't just use `if i > startIdx and nums[i] == nums[i-1]` any more because duplicate numbers might not appear consecutively. In this case, what we need to use is a set to collect all the used values in current level. And we need to initilaize the set before the `for` loop (our `for` loop determines our level). We have a condition to skip the current number if `nums[i] is in used_set`, still, we can only use `continue` instead of `break` because `nums` is not sorted. 

Another question requirement is that the subsequences needs to be non-decreasing. For this requirement, we can either stop it during the for loop or return in the base case. We can simply is add a condition `path and path[-1] > nums[i]` to the `if` statement in the `for` loop. If either this condition or `nums[i]` is duplicated, we need to `continue`.

The last question requirement is all the subsequences in result needs to have at least length of two. For this, we can just check the length of path in the base condition. Remember, we don't return after we append the list to the result, because this is a subset question, the only stop condition is when the `startIdx` enumerates all the values in `nums`.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def findSubsequences(self, nums: List[int]) -> List[List[int]]:
        # cannot sort
        # terminate condition, if i < len(nums) - 1 and len(path) >= 2 and next number is not smaller: append to res
        # for i in range(startIdx, len(nums)):
        # append()
        # pop()

        # 0 4 []; 1 6 []; 2 7 [[4,6]]; 3 [4,6,7]

        res = []
        path = []
        
        def backtrack(nums, startIdx):
            # need to remove duplicates at the same tree level
            # TODO: if there are more than two values in path, check if they are in non-decreasing order.
            # if len(path) >= 2:
            #     if path[-2] <= path[-1]: res.append(path[:])
            #     # elif startIdx == len(nums):
            #     #     res.append(path[:])
            #     else: return

            if len(path) > 1:
                res.append(path[:])

            
            # used set checks for every values in current level
            used = set()
            # tree width can't have decreasing order
            for i in range(startIdx, len(nums)):
                # TODO: continue because nums is not sorted, we might see larger number later as well
                if (path and path[-1] > nums[i]) or (nums[i] in used): continue
                used.add(nums[i])
                path.append(nums[i])
                backtrack(nums, i+1)
                path.pop()
        
        backtrack(nums, 0)

        return res
```
</details>


### 46. Permutations
We can still use backtracking to solve this question. However, it is a little different from other types of questions. Since permutation uses all the values in the given number list. Our base case/recursion stop condition would be `len(path) == len(nums)`. To enumerate all the permutations, we need to use a list of booleans called `used` to pass in to path of the N-ary recursion tree to achieve that. In the `for` loop condition, we don't have startIdx anymore. So what we do here is to loop through all the values in nums, if the number is used, skip the current number, all the way until we used up all the numbers. If the number is not used, we append that number to our path, and then set the corresponding use flag to true (so that this value cannot be use again in this path). Once we finished backtracking, we pop the value out and set the used flag to false (so that it doesn't affect other branches). 

This permutation pattern is subtle, I think I still need to think more clearly about it.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        # does not use start idx
        # create a used set, and pass into each path

        # backtrack
        # sig: input: nums, used; output: None
        # base case: len(path) == len(nums): res.append()
        # induction step: if a value is not used, set the value in used to True, append to path, keep backtracking, pop, 

        res = []
        path = []

        def backtrack(nums, used):
            if len(path) == len(nums): 
                res.append(path[:])
                return
            
            for i in range(len(nums)):
                if used[i] == True: continue

                path.append(nums[i])
                used[i] = True
                backtrack(nums, used)
                path.pop()
                used[i] = False
        
        used = [False for _ in range(len(nums))]
        backtrack(nums, used)

        return res
```
</details>

### 47. Permutations II
This question is just the not-sorted and non-duplicate version 46. Permutations. Use a set to keep track of duplicates in levels and a list to make sure path does not use a index twice.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        # permutation with used set
        # cannot reuse value in tree level

        # TODO: still don't really understand how permutation works,
        # need to understand then know how to modify the template
        res = []
        path = []

        def backtrack(nums, used_list):
            if len(path) == len(nums):
                res.append(path[:])
                return
            
            # level_used will be reset in every level
            level_used = set()
            for i in range(len(nums)):
                if nums[i] in level_used: continue
                if used_list[i] == True: continue
                
                level_used.add(nums[i])
                path.append(nums[i])
                used_list[i] = True
                backtrack(nums, used_list)
                path.pop()
                used_list[i] = False

        used_list = [False for _ in range(len(nums))]
        backtrack(nums, used_list)

        return res
```
</details>

# Conclusion
We don't use `startIdx` in permuation problems because we want to access all values in a path. For duplicates removal, if numbers are sorted, we can use `if i > startIdx and nums[i] == nums[i-1]: break`; if numbers are not sorted, we need to use a set to check duplication.
