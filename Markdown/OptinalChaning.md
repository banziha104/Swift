# 옵셔널 체이닝

> 옵셔널에 속해 있는 nil 일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용하는 일련의 과정
> <br> 중첩된 옵셔널 중 하나라도 값이 존재하지 않는다면 결과적으로 nil 반환

```swift
class Room{
    var number : Int
    init(number :Int){
        self.number = number
    }
}

class Building{
    var name : String
    var room : Room?
    init(name : String){
        self.name = name
    }
}

struct Address{
var province : String
var city : String
var street : String
var building : Building?
var detailAddress : String?
}

class Person {
    var name : String
    var address : Address?
    init(name : String){
        self.name = name
    }
}

let lee : Person = Person(name : "lee")

let leeNumber : Int? = lee.address?.building?.room?.number // nil
if let roomNumber : Int = lee.address?.building?.room?.number{ //옵셔널 체이닝과 옵셔널바인딩
    print(roomNumber)
}else{
    print("it's nil")
}
```

# 빠른종료

> guard 구문은 if와 유사하게 bool 타입으로 실행하며, else 구문에는 자신보다 상우의 코드 블록을 종료하는 코드가 들거가게 됌.

```swift
guard Bool 타입 값 else{
    예외사항 실행문
    제어문 전환 명령
}
```

- 옵셔널 바인딩 활용

```swift
guard let location : String = person["location"] else{
    print("i don't know where are you") 
}
print("\(location) is good")
```


