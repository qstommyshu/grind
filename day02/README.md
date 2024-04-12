# Day 02

Only file called README.md got display

## 977. Squares of a Sorted Array
The idea of this question is to use two pointers to traverse through a sorted array in a absolute value order. And then return the squared value to a new array. Pretty easy once the thought is clear.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        # # brutal force
        # for i in range(len(nums)):
        #     nums[i] = nums[i] ** 2
        # nums.sort()
        # return nums

        # two pointers
        # initialize an result array, and then use two pointers to traverse the input nums array
        res = []
        l = 0
        r = len(nums) - 1
        while l <= r:
            if abs(nums[r]) > abs(nums[l]):
                res.insert(0, nums[r] ** 2)
                r -= 1
            else:
                res.insert(0, nums[l] ** 2)
                l += 1
        return res
```

I was thinking about modifying the array in place initially, but then I see an answer returns a new array, everything became easy since then.
</details>

## 209. Minimum Size Subarray Sum
One of the solution idea of this question is to use sliding window. Initialize a pointer as the left boundary of the sliding window and a pointer as the right boundary of the sliding window. Move the right pointer, mean while check the subarry sum and update the minimum subarray sum. And shrink the left pointer if current subarray sum is larger than the target.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # sliding window
        # start with l and r

        if len(nums) == 0:
            return 0
        l = 0
        arr_sum = 0
        min_len = float('inf')

        for r in range(len(nums)):
            # move right boundary
            arr_sum += nums[r]

            # move left boundary only when in this condition
            while arr_sum >= target:
                min_len = min(min_len, r - l + 1)
                arr_sum -= nums[l]
                l += 1
                        
        if min_len == float('inf'):
            return 0
        return min_len
```

</details>

I almost got exactly this solution initially, but I oversight the question and thought only the subarray sum equals to the target will be considered. My previous solution is not as clean though...

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # sliding window
        # start with l and r

        if len(nums) == 0:
            return 0
        l = 0
        arr_sum = 0
        min_len = float('inf')

        for r in range(len(nums)):
            # move right boundary
            arr_sum += nums[r]

            # move left boundary only when in this condition
            while l < r and arr_sum > target:
                arr_sum -= nums[l]
                l += 1
                
            if arr_sum >= target:
                min_len = min(min_len, r-l + 1)
        
        if min_len == float('inf'):
            return 0
        return min_len
```
</details>


This is incorrect as I didn't check the `min_len` in every step I shrink the array, but it still get the big idea. I think this shows skills to translate my thought to code is fine, but still not there yet. More practice should help!

## 59. Spiral Matrix II
This question is really tricky. It requires the developer to be really clear about the boundary of their program. Things like off by one error can really trick people off!

One way to solve this question is to define traversal boundaries (here we need to think about the traversal intervals as well). Then traverse in a while loop, I feel like many other traversal questions can be done in the same way.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        # count layers
        # max layer is (n + 1) // 2, for every direction, move two position

        # 1. Think about how to traversal in the question
        # if traverse two steps in each direction, then the middle value need to be deal with seperately.
        # if define boundaries and go all the till the boundary, every case can be handled
        matrix = [[-1] * n for _ in range(n)]

        # define bounaries
        top, bot, left, right = 0, n-1, 0, n-1
        count = 1
        # need to be clear about intervals
        # left closed, right open
        while top <= bot or left <= right:
            # left to right
            for i in range(left, right + 1):
                matrix[top][i] = count
                count += 1
            top += 1
            
            # top to bot
            for j in range(top, bot + 1):
                matrix[j][right] = count
                count += 1
            right -= 1

            # right to left
            for k in range(right, left - 1, -1):
                matrix [bot][k] = count
                count += 1
            bot -= 1

            # bot to top
            # for l in range(1, 2) -> 1 time
            for l in range(bot, top - 1, -1):
                matrix[l][left] = count
                count += 1
            left += 1
        
        return matrix
```
</details>
