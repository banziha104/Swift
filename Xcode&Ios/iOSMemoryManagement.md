# Ownership Policy 

- retain : 오너가 객체를 참조함
- release : 오너가 객체 참조를 취소함
- object count : 오너가 몇명을 참조하고 있는지를 나타내며, 0(모든 오너가 release 함)의 경우 삭제된다

# ARC

> Automatic Reference Counting <br>
> 스위프트는 MMR이 아닌 ARC를 사용

# Strong Reference Cycle

