# dayday11

The question today focuses on how to apply stack to questions.

### 20. 有效的括号
This question is easy. Initilaize a stack, add token to stack if found a left parentheses, pop if found a right parentheses. If pop from an empty stack or popped parentheses does not match, then return False. If the stack is empty after all the operations, return True. Otherwise False.

##  1047. 删除字符串中的所有相邻重复项
This question is also easy.
1. Stack: Loop through the string as characters, check if character exists in the stack already. If yes, `pop()` the value. If no, push the value to the top of the stack. 
The result is just turn all the value left in the stack to a string.

## 150. Evaluate Reverse Polish Notation
This question is just fair, still not hard at all. 
Initialize a stack. Parse all the tokens, if token is not an operator, append it to the stack. If found an operator, pop two values out from the stack as operands (the first poped value is always the right operand because of the LIFO nature of stack). Then, do operations based when operator is encounted and append the result back to the stack.

# Conclusion:
Stack's LIFO nature makes it easy to track the previous items in an order so it can be used for eliminating pairs. Revered Polish Notation is also eliminating pairs in under the hood.