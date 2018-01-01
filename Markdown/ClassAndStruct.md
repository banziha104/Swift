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
    
    deinit { //디이니셜라이
        print("클래스 소멸")
    }
}
```

<br>

---

# 구조체와 클래스의 차이

- 같은점
    1. 값을 정의하기 위해 프로퍼티 정의
    2. 기능 실행을 위해 메서드를 정의
    3. 서브스크립트 문법을 통해 구조체 또는 클래가 갖는 값에 접근하도록 서브스크립트를 정의
    4. 초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의
    5. 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있음
    6. 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있음
    
- 차이점 
    1. 구조체는 상속할 수 없음
    2. 타입캐스팅은 클래스의 인스턴스에만 허용
    3. 디이니셜라이저는 클래스의 인스턴스에만 활용 가능
    4. 참조 횟수 계산은 클래스의 인스턴스에만 적용
    
- 구조체 사용시기 (애플 가이드라인)
    1. 연관된 간단한 값의 집합을 캡귤화하는 것만 목적일 때
    2. 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
    3. 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
    4. 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때
    