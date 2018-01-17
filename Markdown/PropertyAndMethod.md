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
    var x : Int = 0
    var y : Int = 0
}

class Position{
    lazy var point : CoordinatePoint = CoordinatePoint()// 옵셔널 저장 프로터티
    let name : String
    
    init(name : String){
        self.name = name
    }
}

let mPosition :Position = Positon(name: "lee") // name은 optional이 아니기때문에 넣어줘야함
/*아래 코드를 실행시, point 프로퍼티의 CoordinatePonit가 생성됨*/
print(mPosition.point)
```

- 연산 프로퍼티

> 실제 값을 저장하는 프로퍼티가 아닌, 특정 상태에 따른 값을 연산하는 프로퍼티

```swift
struct CoodinatePoint {
    var x:Int
    var y:Int
    
    var oppositePoint : CoordinatePoint{
        get{
            return CoodinatePoint(x:-x,y:-y);
        }
        set(opposite){
            x = -opposite.x
            y = -opposite.y
        }
        /*매개변수의 이름 생략시, newValue를 이용함*/
        set{
            x = newValue.x
            y = newValue.y
        }
    }
}
```

- 프로퍼티 감시자 
> 프로퍼티 감시자는 프로퍼티의 값이 새로 할당될떄마다 호출됨. 모든 변수에 사용가능

```swift
class Account{
    var credit: Int = 0 {
        willSet{
            print("잔액 \(credit)원에서 \(newValue)원으로 변경될 예정") // 바뀌기전
        }
        didSet {
            print("잔액 \(credit)원에서 \(newValue)원으로 변경될 예정") // 바뀐후
        }
    }
}

/*상속시 오버라이드 가능*/
class ForeignAccount : Account{
    override var credit: Int{
        willSet{
            print("잔액 \(credit)달러에서 \(newValue)달러로 변경될 예정") // 바뀌기전
        }
        didSet {
            print("잔액 \(credit)달러에서 \(newValue)달러로 변경될 예정") // 바뀐후
        }
    }
}
```

- 타입 프로퍼티

> 인스턴스가 아닌 타입 자체에 속하는 프로퍼티, 그 타입의 모든 인스턴스가 공통으로 사용하는 값

```swift
class AClass{
    static var typeProperty : Int = 1 // 타입 프로퍼티
}
```

# 메서드

- 인스턴스 메서드

> 특정 타입의 인스턴스에 속한 함수를 뜻함

```swift

class LevelClass{

    var level : Int = 0 {
        didSet{
            print("Level \(level)");
        }
        
    }
    
    // 레벨업 메서드
    func levelUp() {
        print("Level Up")
        level += 1
    }
}

struct LevelStruct{
    var level: Int = 0 {
        didSet{
            print("Level\(level)")
        }
    }
    /* 구조체에서 프로퍼티의 값을 바꿔야하는 경우, mutating 키워드 사용*/
    mutating func levelUp(){
        print("Level Up!") 
        level += 1
    }
}
```

- self 프로퍼티 

> 모든 인스턴스는 암시적으로 생성된 self 프로퍼티를 가지고, 자바의 this, 파이썬의 self처럼 자기 자신을 가르키는 프로퍼티.

- 타입 메서드

> 타입 자체에 호출이 가능한 메서드를 타입 메서드라고함, self 프로퍼티가 타입 자체를 가리키게됌

```swift
class AClass{
    
    /* static 타입 메서드 재정의 불가능*/
    static func staticTypeMethod(){
        print("is staticTypeMethod")
    }
    /* class 타입 메서드 상속후 재정의 가능*/
    class func classTypeMethod(){
        print("is classTypeMethod")
    }
     
}
```