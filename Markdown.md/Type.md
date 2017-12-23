# 데이터 타입

- Int : 숫자형
- UInt : 자연수
- Bool : 불리언타입
- Float : 32비트 소수
- Double : 64비트 소수
- Character : 문자
- String : 문자열
- Any : 스위프트 내의 모든 데이터 타입을 사용가능
- AnyObject : 클래스의 인스턴스만 할당가능
- nil : null 과 같음

> 타입 별칭

```swift
typealias MyInt = Int //C언어의 typedef 와 같은 역할

let Var : MyInt 

```

---

<br>

# 튜플과 컬렉션타입

1. 튜플은 타입의 이름이 따로 지정되어있지 않은 지정된 데이터의 묶음

```swift

var person : (name : String, age : Int, Double) = ("lee",100,182.5);
person.1 = 99 // 인덱스를 통해 값할당가능
person.age = 20 //요소 이름을 통해 값을 할당 가능

typealias PersonTuple = (name : String, age :Int) // 타입 별칭 지정

```

<br >

2. 배열 : 배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 컬렉션 타입

```swift
var names : Array<String> = ["1","2","3","4"]
var names : [String] = ["1","2","3","4"] //위와 동일한 선언법

var emptyArray : [Any] = [Any]()
var emptyArray2 : [Any] = [] // 타입 지정을 해줬다면 []로 빈배열 선언가능

```

<br>

3. 딕셔너리 : 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입

```swift
typealias StringIntDictionary = [String : Int]

var numberForName : Dictionary<String,Int> = Dictionary<String,Int>(); // 키는 String, 값은 Int인 딕셔너리 생성
var numberForName : [String : Int] = [String: Int]() // [String: Int]는 Dictionary<String,Int>의 축약형
var numberForName : StringIntDictionary = StringIntDictionary() // 위와 같은 표현
var numberForName : [String : Int] = [:] // 값이 지정되었다면, 빈 딕셔너리를 생성 가능


```

<br>

4. 세트 : 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입, 중복된 값이 존재하지 않음

```swift
var names : Set<String> = Set<String>() // 빈세트 생성
var names : Set<String> = [] // 빈 세트 생성


```

<br >

5. 열거형 : 연관된 항목들을 묶어서 표현 할 수 있는 타입, 정의해준 항목 값 외에는 추가수정이 불가능


```swift
/*기본 열거형*/
enum School{
    case primary
    case elementary
    case middle
    case high
    case collage
}

enum School{
    case primary, elementary , middle, high , collage
    
}

/*원시값을 이용한 열거*/

enum School : String {
    case primary = "유치원"
    case elemenetary = "초등학교"
    case middle = "중학교"
}

let myDigress : School = School.middle;

/* 연관값, 공용체와 비슷함*/

enum MainDish{
    case pasta(taste : String)
    case pizza(dough : String, topping: String)
    case chicken(withSauce : Bool)
    case rice
}

var dinner : Maindish = Maindish.pasta (taste : "크림")
var dinner = .pizza(dough : "치즈크러스트", topping : "불고기")

/* 순환 열거형 : 열거형 항목의 연관 값이 자신의 값이고자 할때 사용 */

indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
}



```
