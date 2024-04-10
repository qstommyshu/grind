# day08

I did not do all the question today, as they are all easy questions in python. I don't see a point of just using C++ to do all these questions (maybe when I'm bored). So I went back to do some previous question again...

## 344. Reverse String
Just `reverse()` in each language or two pointers

## 541. Reverse String II
`for (int i=0; i < nums.size(); i += 2 * k)`, then reverse first `k` elements.

## 151. Reverse Words in a String
`split()` then `reverse()` words

## 704. Binary Search
easy, just need to be careful of intervals

## 35.搜索插入位置
Binary search question needs to think about what to return and the relationship between the value you return and mid.

## 34. 在排序数组中查找元素的第一个和最后一个位置
Two binary search, one to find the first occurance and one to find the last occurance. We can use a function to reduce the code repetition, but the binary search needs to be modified. When we found the value, we still want to update the search interval, but need to keep track of the last occurance of the value.

The key point here is: use a variable to store the last occurance of the variable, because the `left` or `right` value will always end up at a non-target number. 
