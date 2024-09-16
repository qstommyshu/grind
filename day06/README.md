# Day06

Today is more about hash set/map. IMO this is one of the easiest part in leetcode.

## 242. Valid Anagram
There are two main ways to solve this question:
1. sort both string and compare the sorted version O(nlog(n))
2. use frequency map to count the number of times each character appears in one string, and then remove the occurrence of each character in the other string. If there is still characters with non-zero corresponding number left in the string, then the two strings are not valid anagram.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        # feq map
        # edge cases: len different
        if len(s) != len(t): return False
        s_map = Counter(s)
        t_map = Counter(t)
        return all([s_map[char] == t_map[char] for char in s])
```
</details>

Notes:
None

## 349. Intersection of Two Arrays
1. Convert both arrays into sets, and set intersection.
2. Convert the longer array into set, and loop through the shorter array to see if elements exists in the set. If yes, add the element to the result set.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        # # use set
        # res = []
        # # accessing set has lower cost, so we can build a smaller set
        # nums_set = nums1 if len(nums1) > len(nums2) else nums2
        # nums = nums2 if len(nums1) > len(nums2) else nums1
        #
        # for num in nums:
        #     if num in nums_set:
        #         res.append(num)

        return set(nums1).intersection(set(nums2))
```
</details>

Notes:
1. Create set is more expensive than access set


## 202. Happy Number
For this question, we need to first create a function that derives the `squared_sum` of a given number, and check if the `squared_sum` is equal to 1 in a while loop. If not equal, then keep calculating the `squared_sum` of the `squared_sum`. And add this number to a set called `visited`, if this number exists in `visited`, return False (as the `sqaured_sum` calculation will cycle forever). Otherwise, if the `squared_sum` is equal to 1, then return True (meaning it is a happy number).

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def isHappy(self, n: int) -> bool:
        # use set to prevent it to loop endlessly
        # edge cases: more than two digits, less than 0
        if n <= 0: return False
        exists = set()
        while n != 1:
            n = sum([int(x)**2 for x in str(n)])
            if n in exists: return False
            else: exists.add(n)

        return True
```
</details>

Notes: None

## 1. Two Sum
This is the first question in leetcode, just use a `remainder, index` map. And search through the map while loop through the number. O(log(n)).

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # hashmap
        remainders = {}
        for i, num in enumerate(nums):
            if num in remainders:
                return [remainders[num], i]
            remainder = target - num
            remainders[remainder] = i
        return [-1, -1]
```
</details>

Notes: None