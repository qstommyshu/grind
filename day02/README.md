Only file called README.md got display

977. Squares of a Sorted Array
The idea of this question is to use two pointers to traverse through a sorted array in a absolute value order. And then return the squared value to a new array. Pretty easy once the thought is clear.

Answer:
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

209. Minimum Size Subarray Sum
One of the solution idea of this question is to use sliding window. Initialize a pointer as the left boundary of the sliding window and a pointer as the right boundary of the sliding window. Move the right pointer, mean while check the subarry sum and update the minimum subarray sum. And shrink the left pointer if current subarray sum is larger than the target.

Answer:
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
I almost got exactly this solution initially, but I oversight the question and thought only the subarray sum equals to the target will be considered. My previous solution is not as clean though...
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

This is incorrect as I didn't check the `min_len` in every step I shrink the array, but it still get the big idea. I think this shows skills to translate my thought to code is fine, but still not there yet. More practice should help!