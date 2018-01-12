# 클래스 상속

```swift
class ClassName : BaseClassName {
    // 프로퍼티 메소드
}
```

- 재정의 : override 키워드 사용
- super : 부모클래스으의 특성을 사용 할 경우 

<br>

---

# 프로퍼티 재정의

```swift
class Person {
    var name : String = ""
    var age : Int = ""
    var koreanAge : Int {
        return self.age + 1
    }
    
    var introduction : String { 
        return "이름 : \(name). 나이 : \(age)"
    }
}

class Student : Person {
    var grade : String = "F"
    
    override var introduction :String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    override var koreanAge : Int{
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}
```

# 이니셜라이저

- 지정 이니셜라이저 : 모든 프로퍼티를 초기화해야함
- 편의 이니셜라이저 : 항상 가은 값으로 초기화가 가능

```swift
convenience init(매개변수들){
    초기화구문
}

init(name : String, age :Int){
    super.init(name : name, age : age)
}

convenience init(name : String){
    self.init(name:name, age:7)
}
```

- 요구 이니셜라이저 : require 수식어를 사용하며 상속받은 자식클래스에서 반드시 해당 이니셜라이저를 구현해야함

```swift
class Person{
    var name : String
    required init(){
    
    }
}

class Student : Person {
    required init(){
    
    }
}

```
- 클래스 초기화 위임
    1. 자식클래스의 지정 이니셜라이저는 부모클래스의 이니셜라이저를 반드시 호출
    2. 편의 이니셜라이저는 자신을 정의한 클래스의 다른 이니셜라이저를 반드시 호출
    3. 편의 이니셜라이저는 궁극적으로 지정이니셜라이저를 반드시 호출해야함

