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
```

