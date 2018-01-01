# 구조체

> 구조체는 Call-by-Value 형식

- 정의 

```swift
struct 구조체이름{
    프로퍼티와 메소드들
}

struct BasicInformation{
    var name: String,
    var age: Int
}
```

- 인스턴스 생성 및 초기화

```swift
struct BasicInformation{
    var name: String,
    var age: Int
}

var Info : BasicInformation = BasicInformation(name: "lee", age: 99)
Info.age = 100 // 변경가능

```

<br>

---

# 클래스

> 클래스는 Call-By-Reference 형식

- 정의

```swift
class 클래스 이름 : 부모 클래스{
    프로퍼티와 메서드들
}
```

- 인스턴스 생성과 초기

```swift
var lee : Person = Person()
lee.height = 100.1
lee.weight = 100.2

```

- 디이니셜라이저 : 클래스 소멸시 호출되는 메소드

```swift
class Person {
    var height : Float = 0.0
    var weight : Float = 0.0
    
    deinit { //디이니셜라이저
        print("클래스 소멸")
    }
}
```