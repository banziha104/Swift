# 프로퍼티

> 클래스, 구조체 또는 열거형 등에 관련된 값을 뜻함

- 저장 프로퍼티 : 클래스 또는 구조체의 인스턴스와 연관된 값을 저장하는 가장 단순한 개념의 프로퍼티

```swift
struct MyStruct{
    var x : Int
    var y : Int 
}
class MyClass{
    var point : MyStruct
    let name: String
    
    init(name : String , currentPoint: Mystruct){ // 클래스는 이니셜라이즈 클래스 별도생성
        self.name = name
        self.point = currentPoint 
    }
}
let mStruct : MyStruct = MyStruct(x:10,y:5) // 구조체는 기본적으로 저장 프로퍼티를 매겨변수로 가지는 이니셜라이즈가 존대 
```

> 옵셔널 저장 프로퍼티

```swift
/* 옵셔널 저장 프로퍼티 */
struct CoordinatePoint{
    var x : Int
    var y : Int
}

class Position{
    var point : CoordinatePoint? // 옵셔널 저장 프로터티
    let name : String
    
    init(name : String){
        self.name = name
    }
}

let mPosition :Position = Positon(name: "lee") // name은 optional이 아니기때문에 넣어줘야함
mPosition.ponit = CoordinatePoint(x:20,y:10) // 값장입 가능한경우 넣어줄수 있음
```

> 지연 저장 프로퍼티

```swift

struct CoordinatePoint{
    var x : Int
    var y : Int
}

class Position{
    var point : CoordinatePoint? // 옵셔널 저장 프로터티
    let name : String
    
    init(name : String){
        self.name = name
    }
}

let mPosition :Position = Positon(name: "lee") // name은 optional이 아니기때문에 넣어줘야함
mPosition.ponit = CoordinatePoint(x:20,y:10) // 값장입 가능한경우 넣어줄수 있음
```
- 연산 프로퍼티


- 타입 프로퍼티