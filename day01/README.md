# Day 01

今天有重新开始刷题了。第一天就go easy
704. 二分查找
二分查找的本质就是把整个search space 切割成小份，最开始的版本可能甚至是recursion。在这个基础上非常重要的一点就是分割之后的search space定义要跟之前一样 （同时也要定义好搜索区间）。
正确答案：
```Python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        # l = 0, r = len(nums)
        # while l < r: -> edge case: l == r invalid
        # mid = int(l + (r - l) / 2)
        # if nums[mid] == target: return mid
        # elif nums[mid] < target: l = mid + 1
        # elif nums[mid] > target: r = mid - 1
        # out of while -> cannot find target -> return -1

        l = 0 
        r = len(nums)
        while l < r:
            mid = int(l + (r - l) / 2)
            if nums[mid] == target:
                return mid
            elif nums[mid] < target:
                l = mid + 1
            else:
                r = mid
        return -1
```
今天其实犯了一个小错误，在else 里 r = mid - 1。这个错误其实就是搜索区间没定义好导致的，l 和 r 的initialization 还有 while l < r 定义了一个左闭右开区间`[)`但是在更新r 的时候 `r = mid + 1` 的话就会导致 `mid-1` 这个index 不会被搜索到（因为右边是开区间）。

27. 移除元素
这题主要就是考研对代码的掌控能力，但是很惭愧，python里的iterator到时我一开始甚至没写出暴力解法。。。
```Python3
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        count = len(nums)
        for i in range(len(nums)):
            if nums[i] == val:
                for j in range(i+1, len(nums)):
                    nums[j-1] = nums[j]
                count -= 1
                # this modification does not modify i as i is produced by iterator
                i -= 1
        return count
```
这里`i-=1`是不会update `i`的，因为`i`是由iterator生成的。但是用C++的话同样的写法就可以，i--可以update i:
```C++
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int size = nums.size();
        for (int i=0; i < size; i++) {
            if (nums[i] == val) {
                for (int j = i+1; j < size; j++) {
                    nums[j-1] = nums[j];
                }
                i --;
                size--;
            }
        }
        return size;
    }
};
```
还有个第二种解法是双指针：
```C++
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        // two pointers
        int slow = 0;
        for (int fast = 0; fast < nums.size(); fast++) {
            if (nums[fast] != val) {
                slow++;
                nums[slow] = nums[fast];
            }
        }
        return slow;
    }
};
```
其实leetcode的重点就是想出解题思路，代码掌控能力练一练就差不多了。