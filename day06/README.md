# Day06

Today is more about hash set/map. IMO this is one of the easiest part in leetcode.

## 242. Valid Anagram
There are two main ways to solve this question:
1. sort both string and compare the sorted version O(nlog(n))
2. use frequency map to count the number of times each character appears in one string, and then remove the occurance of each character in the other string. If there is still characters with non-zero corresponding number left in the string, then the two strings are not valid anagram.

## 349. Intersection of Two Arrays
1. Convert both arrays into sets, and set intersection.
2. Convert the longer array into set, and loop through the shorter array to see if elements exists in the set. If yes, add the element to the result set.
3. Use an array to store the frequency of each number, and 


## 202. Happy Number
For this question, we need to first create a function that derives the `squared_sum` of a given number, and check if the `squared_sum` is equal to 1 in a while loop. If not equal, then keep calculating the `squared_sum` of the `squared_sum`. And add this number to a set called `visited`, if this number exists in `visited`, return False (as the `sqaured_sum` calculation will cycle forever). Otherwise if the `squared_sum` is equal to 1, then return True (meaning it is a happy number).

## 1. Two Sum
This is the first question in leetcode, just use a `remainder, index` map. And search through the map while loop through the number. O(log(n)).