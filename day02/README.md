# Day 02

Only file called README.md got display

## 209. Minimum Size Subarray Sum
One of the solution idea of this question is to use sliding window. Initialize a pointer as the left boundary of the sliding window and a pointer as the right boundary of the sliding window. Move the right pointer, meanwhile check the subarray sum and update the minimum subarray sum. And shrink the left pointer if current subarray sum is larger than the target.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
#         sliding window
#       right pointer move, while sum >= target, left pointer shrink
#       then get the smallest
#       left close, right close
        min_len = float("inf")
        left = 0
        cur_sum = 0
        for right in range(len(nums)):
            cur_sum += nums[right]
            while cur_sum >= target:
                cur_len = right - left + 1
                min_len = min(cur_len, min_len)
                cur_sum -= nums[left]
                left += 1
                
                # # TODO: This order is incorrect, because after shifting left,l is not the number we look at anymore
                # left += 1
                # l = nums[left]
                # cur_sum -= l

        return min_len if min_len != float("inf") else 0
```
</details>

Notes:
1. For any sliding window question, make sure to take care of the case where the window length is not updated at all (being in its initialized value `float('inf')`), we should return the window length as `0` in this case.
2. Make sure to use a value before updating it, `cur_sum -= nums[left]` before `left += 1`. Otherwise, the code cannot guarantee `cur_sum -= nums[left + 1]` is still greater than or equal to `target`. 

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

<details>
<summary>Python Solution V2</summary>

```Python
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        # first create empty matrix, then fill it
        # while i < n**2?
        # top, bottom, left, right?
        # left close, right open
        res = [[0 for _ in range(n)] for _ in range(n)]
        num = 1
        # paddings
        top = 0
        bottom = n - 1
        left = 0
        right = n - 1
        # TODO: be careful of adding num breaks the while loop,
        # another way is to initialize num as 0 and num += 1 before assignment
        while num <= n ** 2:
            # left to right at top row
            for i in range(left, right + 1):
                res[top][i] = num
                num += 1
            # finished top row
            top += 1

            # top to bottom at right column
            for j in range(top, bottom + 1):
                res[j][right] = num
                num += 1
            right -= 1

            for k in range(right, left-1, -1):
                res[bottom][k] = num
                num += 1
            bottom -= 1

            for l in range(bottom, top-1, -1):
                res[l][left] = num
                num += 1
            left += 1

        return res
```
</details>

Notes:
1. Make sure you are clear about your logic before start coding.
2. Think about different cases like when number is odd or even.
3. Make sure your search range always follow the same pattern (i.e. left close right open or left close right close), note the search range definition is defined when initializing variables!