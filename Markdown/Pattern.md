### 와일드 카드 패턴

> 해당 자리에는 값을 무시

```swift
let string: String = "ABC"

switch string {
    case _: print(string) // 항상 실행
}
```

### 값 바인딩 패턴

> 변수 또는 상수의 이름에 매치된 값을 바인딩하는 것

```swift
switch lee{
    case let (name,age,gender) : print (/*...*/)
}
```

### 튜플 패턴

> 소괄호 내에 쉼표로 분리하고, 그에 상응하는 튜플 타입과 값을 매치함.

```swift
let (x,y) : (Int,Int) = (1,2)
```

### 열거형 케이스 패턴

> 열거형 타입의 case와 매치

```swift
enum Maindish {
    case pasta(taste : String)
    case pizza(dough : String , topping : String)
    case chicken(wothSauce : Bool)
    case rice 
}

var dishes: [MainDish] = []

var dinner : MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner{
    print("\(taste) 파스타")
}
```

### 옵셔널 패턴

> 옵셔널 또는 암시적 추출 옵셔널 열거형에 감싸져 있는 값을 매칭시킬떄 사용함

```swift
var optionalValue : Int? = 100

if case .some(let value) = optional {
    print(value)
}

if case let value? = optionalValue{
    print(value)
}

q
```

