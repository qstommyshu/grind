# Day07

Today's question is not that close to hashmap, more about different variantions of two sum.

## 454. Four Sum II
This question is a variation of the question two sum. Basically treat the concatination of two arrays as an array, and then store their sum combination to a hashmap. Then calculate all the combination of the other two arrays, check if there is a corresponding value in hashmap that sums up to the target value. This way it reduces the complexity from n^4 to 2*n^2.

## 383. Ransom Note
This question is very easy. Just loop through the `ransomNote` and create a hashmap counting all the letters required to create `ransomNote`. And then loop through the `magazine` to decrease the corresponding letter count. If all all the hashmap value turned into zero, return True, else False.


## 202. Three Sum
This question is actually not easy. A relatively easy way to first sort the array to make sure we can efficiently remove duplicate value later. And then we use a for loop to determine the initial value `A` for calculating the sum. And then use two pointers to loop through the remaining array to get the other two values `B` and `C`. For duplicate removal, we need to note that `A` and `B` and `C` can be the same (but `A` can't have the same value for the next round). So we need to remove duplicate value after we first use those value.

## 18. Four Sum
This is just another for loop on top of the three sum question, still need to keep account for the duplicate removal.