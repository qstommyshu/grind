# Day04

Today is more about linked list. I think my understanding about linked list is a little deeper now.

## 24. Swap Nodes in Pairs
This is the first question today. For this question, `dummy_head` is still my best friend for linked list. 
It saved me so much trouble in manipulating the head pointer and the inconsistency of the state transition function for the first node. The overall idea is not hard, just reorganize the pointer and similate.

## 19. Remove Nth Node From End of List
This question is pretty easy. Still, `dummy_head` eliminates the head node removal case. The basic idea is use two pointers on linked list. Fast pointer points to `n` nodes after the `dummy_head` and slow pointer points to the `dummy_head`. The simultaneously move both the `fast` and `slow` pointer. Once the `fast` pointer reaches the end, the `slow` pointer is at the position to remove the `n`th node from the end of the list.

## 160. Intersection of Two Linked Lists
This question is also easy. We first loop through both `A` and `B` to get the length of the two linked list. And then match the starting position of the longer list head to the smaller list head. Then simultaneously loop through both of them and check if their current node are the same. If yes, return the node, otherwise they don't intersect.

## 142. Linked List Cycle II
There is a damn complicated solution for this question. I don't think it is possible to use this method in an interview. So I'm just sticking with a easy method, keep a set of visited nodes and check if this node appears again in the set.