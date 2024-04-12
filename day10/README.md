# day10

Both question today are super easy. So I did extra question from Neetcode 150, binary search section to test out my skills.

## 232. Implement Queue using Stacks
Two stasks, one for push and one for pop. When pop, if the pop stack is empty, pop all elements from push stack to pop stack.

## 225. Implement Stack using Queues
This can be done by using one queue or two queues. 
For poping, the main idea is the move the last element inserted into the queue to the last index of the queue, then pop it out (This can be implemented by using one queue or two queues).
For inserting, we can just insert to the front of the queue.
For top, just access the first element of the insert queue (last element being inserted).

## 74. Search a 2D Matrix
This question is just two binary search combined together. What I did is use a for loop to check which line the number can be on and once we get the information, perform binary search in that line. This give an O(m + log(n)) complexity. Another way to do this question is to use binary search to find the line and then perform binary search, this gives an O(log(m * n)) complexity.

## 875. Koko Eating Bananas
This question is actually pretty interesting. The idea is to test out all the possible value of `k` and see koko can finish all the bananas within `h` hours. Since we are testing consecutive numbers, binary search can be applied to reduce the search time.