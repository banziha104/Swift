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

2. 배열 : 배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 컬렉션 타입

```swift
var names : Array<String> = ["1","2","3","4"]
var names : [String] = ["1","2","3","4"] //위와 동일한 선언법

var emptyArray : [Any] = [Any]()
var emptyArray2 : [Any] = [] // 타입 지정을 해줬다면 []로 빈배열 선언가능

```

3. 딕셔너리 : 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입

```swift
typealias StringIntDictionary = [String : Int]

var numberForName : Dictionary<String,Int> = Dictionary<String,Int>();

```


