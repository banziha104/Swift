# 조건문

<br>

- if문

```swift
let first : Int = 5
let second : Int = 10

if first > second {
    //something..
} else{
    //something
}
```

<br>


- switch 문

```swift
let doubleValue: Double = 3.0

switch doubleValue {
    case 0:
        print(0)
    case 1.5...10.5 :
        print(1.5)
        fallthrough // 타 언어의 braek를 걸지 않았을 경우, 넘어가는 트릭을 위해서 사용
    default :
        print("other")
}


```

<br>


# 반복문

<br>


- for-in 문 

```swift
for i in 1...10{ //1부터 10까지

}

for _ in 1...10{ // _ : 와일드 카드로, 사용할 필요 없는 경우 사용

}

for tuple in dictionary{ // 기본 컬렉션 타입에서 딕셔너리 사용시 튜플로 넘어옮

}
```

<br>


- while 구문 

```swift
while names.inEmpty == false{

}
```

<br>


- repeat-while 구문 : 타 언어의 do-while 문과 같음

```swift
repeat {

} while aa == true 

```

<br>


- 구문 이름표 : 반복문의 중첩의 경우, break와 같은 제어 키워드가 어디에 작동하는지 명시적으로 나타내줌

```swift

numberLoop : for num in numbers{
    printLoop : while true{
        break numberLoop // numberLoop 종료
    }
}
```