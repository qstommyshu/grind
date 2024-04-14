# day12

The question today are super hard, I didn't solve any of them myself lol.

### 239. Sliding Window Maximum
This question is savage. I initially tried brutal force simulation, all the off by one errors trapped me toughly, yet still time limit exceed. Then I found a solution using using deque (double sided queue). The idea is to use a deque to collect all the information we need (max value, and potential future max value). Before actually working on the solution, there are several question we need to be clear about. 

1. What data structure should I use?
2. What are the characteristics of this data structure?
3. What does the right most element of this data structure stands for?
4. What does the left most elment of this data structure stands for?
5. What is the condition for insert and pop?
6. How should we represent the sliding window? And how should we move the window?
7. What should be the terminate condition of this program?
8. What is the time and space complexity of this program?

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        # the max sliding window
        # use deque
        # l and r = 0, left closed, right closed
        # deque stores the index of elements because this is easier for us to know what element to pop from the left
        # when append: if the appending value is larger than or equal to all elments in the deque, clear the deque then append
        # when pop: if l > q[0], because q[0] is the largest element and append handles the smaller number in the deque, 
        # we only need to pop when the largest value is no longer in our window
        # when we have a full size window, we start to append value to result

        res = []
        # left closed and right open?
        l = r = 0
        # right most element is the largest
        q = collections.deque()
        while r < len(nums):
            # add: only need the largest element
            # q[-1] is the top element in queue
            # TODO: q[-1] is the latest value added to the queue
            # q[-1] < nums[r] means we don't need q[-1], but the top element won't be poped as 
            # top element is always q[0]
            while q and nums[q[-1]] < nums[r]:
                q.pop()
            q.append(r)

            # out: 
            # if (len(q)) >= k: # when there are at least k elements in q
            #     if l > q[]

            # TODO: what does q[0] stands for?
            # q[0] is the left the left most element in q, because numbers are appended to the queue
            # l > q[0] means q[0] is no longer in the sliding window
            if l > q[0]:
                q.popleft()

            # res
            # TODO: why (r + 1) >= k works but len(q) >= k not?
            # what does r stands for here?
            # r is the index of the element to be inserted
            # r - l + 1 is the size of the q,
            # the size of q is not the size of the window
            # print(r - l + 1, len(q))
            if (r - l + 1) == k:
                # q[0] is the left most position in the queue
                res.append(nums[q[0]])
                l += 1
            
            r += 1
        return res
```
</details>

### 347. Top K Frequent Elements
I have at least some thought about this question, although it is not the most efficient solution. My thought is to first create a frequency map, an then put it into a max heap (which python doesn't have, python heapq is only min heap), then pop k times to get the result. The time complexity of this solution is `O(max(klog(n), n))`. Heapify building heap heap takes `O(n)` time, and k times pop takes `klog(n)` time complexity.

A more optimal solution is using bucket sort. Still create a frequency map but sort it using an array for size `n`. Each index `i` of the array stores a list that contains all elements that appears `i` times in the array nums. Once we have the frequency map, we can just do: `for num, count in freq.items(): bucket[count].append(num)`. And then we can loop through the bucket from right to left until we collected k elements.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # frequency map with heap?
        # put all the elements from frequency map to a min heaq, and pop k
        freq = {}
        bucket = [[] for _ in range(len(nums) + 1)]
        for num in nums:
            freq[num] = 1 + freq.get(num, 0)
        
        for num, count in freq.items():
            bucket[count].append(num)
        
        res = []
        for i in range(len(bucket)-1, 0, -1):
            for num in bucket[i]:
                res.append(num)
                if len(res) == k:
                    return res
```
</details>

# Conclusion
Off by one error, this is so important in code logic