# day28

It's been a while since the last time I share my thoughts, but I have been working on backtraking questions. Most of backtracking questions I've done are just template questions. I just need to understand how to apply the template to the question. 

### 93. Restore IP Addresses
This is a brutal force template question. Since an IP address can only contain 4 groups of integers, so the base case stop condition would be `if len(path) > 4: return` for the case when the number got partitioned to more than 4 groups of integers; `if len(path) == 4 and startIdx == len(s)` for the case when we parsed all integers and splitted them into 4 groups, we then use `'.'.join(path)` to append the joined value to the result. For induction step, we create substring from the numbers input number strings. If there is any number that is not numeric, we are sure this group of numbers cannot be partitioned to valid IP Addresses, then break from this loop; and if we partitioned a string that has length more than 1 and starts from 0, we can break from the loop as well (because we have already appended a number that makes this number starts from 0, we can't fix this number in later step anymore); and if we parsed a number that is not between 0 and 255, break as well. After all these check, we can then append our substring and keep triggering backtrack.

Seems all substring questions follows a pattern:

```
for i in range(startIdx, len(xxx)):
    subs = s[startIdx, i+1]
```

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def restoreIpAddresses(self, s: str) -> List[str]:
        # observation:
        # len(path) == 4 and startIdx == len(s): append (if len(path) > 4: return)
        # if len(subs) != 1 and subs[0] == '0': stop
        # elif not (0 <= int(subs) <= 255): stop
        # if not s[i].isalphabetical(): return [] (invalid)

        res = []
        path = []

        def backtrack(s, startIdx):
            if len(path) > 4: return
            # processed the whole string and splitted into 4 parts
            if len(path) == 4 and startIdx == len(s):
                res.append('.'.join(path))
                return
            
            for i in range(startIdx, len(s)):
                subs = s[startIdx : i+1]
                # found a invalid character
                if not s[i].isnumeric(): break
                # this parse found a number starting with 0
                if len(subs) > 1 and subs[0] == "0": break
                if not (0 <= int(subs) <= 255): break

                path.append(subs)
                backtrack(s, i+1)
                path.pop()
            
        backtrack(s, 0)

        return res
```
</details>

### 78. Subsets
The Subsets question is also template. The thing that is different is when do we append to result. 
For this question, my thought is to try all possible cases of numbers that ends in the last number in `nums`. We first append the path to the result before our base case condition because if we do `res.append(path[:])` after the `startIdx == len(nums): return` check, then we can't append the case where all the values got appended to the path. After that, it is just the templated for loop in backtracking questions.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        path = []

        def backtrack(nums, startIdx):
            # TODO: this needs to be before the return statement because we append up to path[i] to res when startIdx == i + 1
            res.append(path[:])
            if startIdx == len(nums): return

            for i in range(startIdx, len(nums)):
                path.append(nums[i])
                backtrack(nums, i+1)
                path.pop()
        
        backtrack(nums, 0)

        return res
```
</details>


### Subsets II
This question is similar to Subsets but we need to do an extra step to remove duplicates. Duplicates cannot exists on the same backtracking tree level but can exists on the same tree path, and the `i` in `for i in range(startIdx, len(nums)):` defines the width/level of a tree. So what we can do is add a condition: `if i > startIdx and nums[i] == nums[i-1]: continue`, the `i > startIdx` makes sure the current `i` we went through is not first value in this level (first value in current level cannot be duplicated). The `nums[i] == nums[i-1]` check if a value is duplicated in this level, if it is, then we skip this branch as all the branches starts from this point will be contained in branches starts from the previous non-duplicated value.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        # sort
        # same level cannot contain duplicates
        # if i > startIdx and nums[i] == nums[i-1]

        # time complexity: O (n(depth) * )
        # space complexity: O(n) (depth of the tree in recursion call stack)
        nums.sort()

        res = []
        path = []

        def backtrack(nums, startIdx):
            res.append(path[:])
            if startIdx == len(nums): return

            for i in range(startIdx, len(nums)):
                if i > startIdx and nums[i] == nums[i-1]:
                    continue
                path.append(nums[i])
                backtrack(nums, i+1)
                path.pop()
        
        backtrack(nums, 0)
        return res
```
</details>

# Conclusion
