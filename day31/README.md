# day31

Today is the start of greedy algorithms. The general idea of greedy algorithm is global optimal solution is constructed by local optimal solutions. So just try to greedyly pick local optimal solution, it is said there is no obvious pattern for greedy questions, should be done is to first, see if greedy works, and then check if you can find a counter example that greedy does not work on.

### 455. Assign Cookies
The main idea of this question is to reduce the waste of cookie size, greedily picking the smallest possible cookies for each child. So what I did is first sort both `g` and `s`, and initialize a variable `g_idx` to indicating which child in `g` we have feeded. Then loop through the sorted `s` and `if g_idx < len(g) size >= g[g_idx]` to first make sure `g_idx` is not out of bound and the cookie is enough to feed a child. If that is the case, we can usethe cookie to feed to corresponding child indicated by `g_idx`. Hence, `res += 1` and `g_idx += 1` (move to the next child).

<details>
<summary>Python code</summary>

```Python
class Solution:
    def findContentChildren(self, g: List[int], s: List[int]) -> int:
        # for each cookie, find the closest greed factor
        # sort g and s
        # for each child, find the closest but >= greed factor
        g.sort()
        s.sort()

        res = 0
        g_idx = 0
        # small cookie feed less greedy child first
        for size in s:
            if g_idx < len(g) and size >= g[g_idx]:
                res += 1
                g_idx += 1
        
        return res
```
</details>


### 376. Wiggle Subsequence
In order to extend the length of wiggle subsequence, we can greedily remove all the numbers that are not peaks. There are three cases we need to take care about: 
1. When `pre_diff` and `cur_diff` have different sign, the subsequence is wiggle. 
2. When `pre_diff` is flat and `cur_diff` has a sign, `res += 1` because we can create a peak by deleting all previous flat numbers and create a trivial wiggle subsequence.
3. When `pre_diff` is in a pattern: flat-up-flat-up. Our previous method will double count the middle point as a peak as well. For this, we only update `pre_diff` when the sign changes, which this is a real peak instead of a middle point.

<details>
<summary>Python code</summary>

```Python
class Solution:
    def wiggleMaxLength(self, nums: List[int]) -> int:
        # longest wiggle subsequence
        # larger than or smaller than previous number

        # eliminate all climbing numbers, just leave peak numbers
        # edge case: if not nums: return 0; if len(nums) == 1: return 1; if len(nums) == 2: return 2

        # use pre_diff and cur_diff
        # There are three cases: 
        # 1. When pre_diff and cur_diff has different sign
        # 2. When pre_diff is flat and cur_diff has a sign, count, because we can always create
        # peak by deleting all the previous flat numbers and create a trivial wiggle subsequence
        # 3. When pre_diff is monotonically increasing and flat, the increase again, this case 
        # we actually only have two peaks, but previous case calculation may count 3 cases. So here
        # we only update pre_diff when sign changed (so we don't catch the flat-up-flat-up case)

        if len(nums) <= 1: return len(nums)
        pre_diff = 0
        cur_diff = 0
        # initialize to 1 because we have at least trivial case if the length of sequence is larger than 1
        res = 1

        # TODO: think about different cases

        for i in range(len(nums)-1):
            # don't manually calculate pre_diff, update cur_diff to be pre_diff
            cur_diff = nums[i+1] - nums[i]
            # case 1 and case flat-diff
            if (pre_diff >= 0 and cur_diff < 0) or (pre_diff <= 0 and cur_diff > 0):
                res += 1
                # case 3: only update pre_diff when there is a diff sign change
                pre_diff = cur_diff
        
        return res
```
</details>

### 53. Maximum Subarray
For this question, the greedy condition is to start from any number that contribute to a positive subarray sum. However, there is one condition we need to check, when there is only a negative number in the array, that negative number is the maximum subarray sum (since it is the only number in the subarray, if all numbers are negative, then the largest negative number is the maximum subarray). Therefore, we should initialize `max_sum` to the smallest integer and loop through all numbers, and then loop through all numbers in `nums`. We first calculate the local `cur_sum`, and then update `max_sum` if `cur_sum` is larger than `max_sum`. After this, if `cur_sum` is negative, we reset `cur_sum` to 0 in order to simulate `cur_sum` to move to the next index.

<details>
<summary>Python code</summary>

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        # what is local best case?
        # sub-array sum is positive
        # keep track of max_sum, and cur_sum: max_sum = max(max_sum, cur_sum)
        # if cur_sum + nums[i] < 0: update cur_sum to 0 (simulate we start from a new index)
        # then return the max_sum

        max_sum = -float('inf')
        cur_sum = 0
        for num in nums:
            # if cur_sum + nums[i] > 0:
            #     cur_sum += nums[i]
            # elif cur_sum + nums[i] < 0:
            #     cur_sum = 0
            cur_sum = cur_sum + num
            max_sum = max(cur_sum, max_sum)
            if cur_sum < 0: cur_sum = 0
        
        return max_sum
```
</details>

# Conclusion
Finally started greedy questions, need to think about how to approach greedily, did not try to come up with a counter example for any of these questions, need to do it in the future.