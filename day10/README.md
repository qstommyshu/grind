# day08

Both question today are super easy.

## 232. Implement Queue using Stacks
Two stasks, one for push and one for pop. When pop, if the pop stack is empty, pop all elements from push stack to pop stack.

## 225. Implement Stack using Queues
This can be done by using one queue or two queues. 
For poping, the main idea is the move the last element inserted into the queue to the last index of the queue, then pop it out (This can be implemented by using one queue or two queues).
For inserting, we can just insert to the front of the queue.
For top, just access the first element of the insert queue (last element being inserted).
