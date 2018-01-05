# 인스턴스 객체의 생성과 소멸


- 이니셜라이저를 정의하면 초기화 과정을 직접 구현가능

```swift
class SomeClass{
    init(){
        // 초기화 코드
    }
}

struct SomeStruct{
    init(){
        // 초기화 코드
    }
}
```

- 프로퍼티 기본값 & 매개변수 : 옵셔널 저장 프로퍼티를 제외한 모든 저장 프로퍼티에 적절한 초깃값을 할당해야함

```swift
class Area{
    var squareMeter : Double
    init(fromPy py : Double){   //첫번째이니셜라이저
        squareMeter = (py * 3.3058);
    }
    init(fromSquareMeter squareMeter : Double){ // 두번째 이니셜라이저
        self.squareMeter = squareMeter
    }
    init(value : Double){ // 세번째 이니셜라이저
        squareMeter = value
    }
}
```

- 옵셔널 프로퍼티 타입 : 초기화 과정에서 값을 초기화하지 않아도 되는 경우, 옵셔널로 선언

- 상수 옵셔널 타입 : 초기화 시에만 할당할 수 있음

```swift
class Person{
    let name : String
    var age : Int?
    
    init(name : String){
        self.name = name
    }
}
```

- 기본이니셜라이저와 멤버와이즈 이니셜라이저

> 이니셜라이저를 정의해주지않으면, 프로퍼티에 기본값이 지정되어 있따는 전제하에 기본 이니셜라이저를 사용함
> 기본 이니셜라이저는 