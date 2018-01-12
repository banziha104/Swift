# 함수와 메서드

> 구조체 클래스 열거형 등 특정 타입에 연관되어 사용하는 함수를 메서드 모듈 전체에서 사용할 수 있는 함수를 함수라 부

<br>

1. 기본적인 함수의 정의

```swift
func 함수 이름(매개변수...) -> 반환 타입{
    실행 구문
    retrun 반환 값
}
```


<br>

2. 매개변수가 없는 함수

```swift
func helloWorld() -> String{
    return "Hello,World"
}
```

<br>


3. 전달인자 레이블 : 매개변수의 역할을 좀 더 명확히 할 수 있음, 전달인자 레이블이 다르면, 오버로드 가능

```swift
func say(from myName:String, to name:String) -> String{
    return "Hello \(name), I'm \(myName)"
}
print(say(from : "my", to: "ll"))

/* 와일드 카드를 이용해 전달인자 레이블 없에기*/

func say2(_ myName : String, _ name:String) -> String{
    return "Hello \(name), I'm \(myName)"
}

print(say2("my","ll"))
```

<br>


4. 매개변수 기본 값 : 함수에서 매개변수마다 기본값 지정가능

```swift
func ads(_ name : String, times : Int = 3) -> String { //times 변수가 기본으로 3을 가짐
    
}
```

<br>

5. 가변 매개변수  : 매개변수의 값으로 몇개가 들어올지 모를 때 사용, 배열처럼 사용가능

```swift
func sayHello(me : String , friends names : String...) -> String{
    for friend in names {
    
    }
}
```

5. 입출력 매개변수 : C언어의 포인터와 비슷함, call-by-reference로 받음

```swift
func name(_ arr:[Int]) {
    
}

name(&number) //&을 붙이면 참조값으로 바뀜
```

<br>

# 중첩 함수

> 스위프트는 데이터 타입의 중첩이 자유로움. 

```swift

typealias MoveFunc = (Int) -> Int // 함수 지정

func functionForMove(_ shouldGoLeft : Bool) -> MoveFunc{
    func goRight(_ curPos : Int) -> Int {
    
    }
    func goLeft(_ curPos: Int) -> Int {
     
    }
    return shouldGoLeft ? goLeft : goRight
}

```

- inout 키워드 : 해당되는 값을 참조로 바꿀 경우

```swift
func swap(value v1: inout Int, with v2: inout Int) {
   let buffer = v1
   v1 = v2
   v2 = buffer
}

var a = 123
var b = 456
swap(value: &a, with: &b)

```