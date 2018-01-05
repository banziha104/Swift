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

> 이니셜라이저를 정의해주지않으면, 프로퍼티에 기본값이 지정되어 있따는 전제하에 기본 이니셜라이저를 사용함 <br>
> 기본 이니셜라이저는 프로퍼티 기본값으로 프로퍼티를 초기화해서 인스턴스를 생성함.
> 구조체는 사용자정의 이니셜라이저를 구현하지 않으면, 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저인 멤버와이즈 이니셜라이즈가 실행

```swift
struct Point{
    var x : Double = 0.0
    var y : Double = 0.0
}

struct Size {
    var width : Double = 0.0
    var height : Double = 0.0
}

let point : Point = Point(x:0,y:0);
let size : Size = Size(width: 50.0, height :50.0)
```

- 초기화 위임

> 값 타입인 구조체와 열거형은 코드의 중복을 피하기 위하여 이니셜라이저가 다른 이니셜라이저에게 일부 초기화를 위임하는 초기화 위윔을 구현가능.(클래스는 불가능)

```swift
enum Student {
    case elementary, middle, high
    case none
    
    init(){
        self = .none
    }
    
    init(koreanAge : Int){
        switch KoreanAge {
            case 8...13:
                self = .elementary
            case 14...16 :
                self = .middle
            case 17...19 :
                self = .high
            default : 
                self = .none
        }
    }
    
    init(bornAt : Int, currentYear : Int){
        self.init(koreanAge: (currentYear - bornAt + 1)) // 초기화 위임 
    }
}
```

- 실패 가능한 이니셜라이저

> 이니셜라이저를 통해 인스턴스를 초기화할 수없는 여러 가지 상황이 있음. 이럴때 실패가능성을 내포한 이니셜라이저를 실패 가능한 이니셜라이저라고 부름

```swift
class Person{
    let name : String 
    var age : Int?
    
    init?(name: String){
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}
```

- 클로저를 통한 프로퍼티 기본값 설정

> 클로저가 실행되는 시점은 초기화할 때, 다른 프로퍼티 값이 설정되기 전임
```swift
class Student{
    var name : String?
    var number: Int?
}

class SchoolClass{
    var students : [Student] = {
        var arr : [Student] = [Student]()
        
        for num in 1...15{
            var student : Student = Student(name:nil, nubmer:nil)
            arr.append(student)
        }
        return arr
    }() // 클로저 실행
}
```

- 디이니셜라이저 : 클래스의 인스턴스에만 구현할 수 있음

```swift
 class SomeClass{
    deinit {
        print("인스턴스 소멸")
    }
    
 }
 
var instance : SomeClass? = SomeClass()
instance = nil // 인스턴스 소멸
```

