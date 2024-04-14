# dayday11

The question today focuses on how to apply stack to questions.

### 20. 有效的括号

This question is easy. Initilaize a stack, add token to stack if found a left parentheses, pop if found a right parentheses. If pop from an empty stack or popped parentheses does not match, then return False. If the stack is empty after all the operations, return True. Otherwise False.

## 1047. 删除字符串中的所有相邻重复项

This question is also easy.

1. Stack: Loop through the string as characters, check if character exists in the stack already. If yes, `pop()` the value. If no, push the value to the top of the stack.
The result is just turn all the value left in the stack to a string.

## 150. Evaluate Reverse Polish Notation

This question is just fair, still not hard at all.
Initialize a stack. Parse all the tokens, if token is not an operator, append it to the stack. If found an operator, pop two values out from the stack as operands (the first poped value is always the right operand because of the LIFO nature of stack). Then, do operations based when operator is encounted and append the result back to the stack.

The questions are too easy so I did extra question, went back to check the spiral matrix question. It really requires precise control of your code, needs practice.

## 59. Spiral Matrix II

There are various methods to solve this question, one method is to use boundaries for traversal (Need to be careful about search intervals as well). First define boundaries, `top, bot, left, right`. Then use a while loop `top <= bot and left <=right` to traverse the matrix: Traverse through four directions. After traversing one direction, update the corresponding value.

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

## 54. Spiral Matrix
This question can also be solved by using define boundaries, but I didn't fully understand this question yet. I'm still not too clear about the `if` condition in the for loop.

<details>
<summary>Python Solution</summary>

```Python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        # still define bounaries
        # change direction when hit bounaries
        if len(matrix) == 0:
            return []
        res = []
        rows = len(matrix)
        cols = len(matrix[0])
        top, bot, left, right = 0, rows - 1, 0, cols - 1
        while len(res) < rows * cols:
            for i in range(left, right + 1):
                res.append(matrix[top][i])
            top += 1
    
            # extra step？
            for j in range(top, bot + 1):
                res.append(matrix[j][right])
            right -= 1

            # when traverse from left to right, we still want to make sure
            # the top and bot condition is valid
            if top <= bot:
                for k in range(right, left-1, -1):
                    res.append(matrix[bot][k])
                bot -= 1

            if left <= right:
                for l in range(bot, top-1, -1):
                    res.append(matrix[l][left])
                left += 1

        return res
```
</details>

# Conclusion

Stack's LIFO nature makes it easy to track the previous items in an order so it can be used for eliminating pairs. Revered Polish Notation is also eliminating pairs in under the hood.
