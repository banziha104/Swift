# 옵셔널

> 스위프트의 특징 중하나인 안정성을 문법으로 담보하는 기능, 변수나 상수의 값이 nil 일 수도 있다는 것. <br>
> 매개변수를 굳이 넘기지 않아도 된다는 개념과 비슷함.



```swift
var myName : String = "aa"
myName = nil //에러

var myName2 : String? = "bb"
myName = nil // 에러가 안남

let myName3 = "aaa"
let result = myName3 ?? "abc"
```

<br>

---

# 옵셔널 추출

> 옵셔널의 값을 옵셔널이 아닌 값으로 추출

* 강제 추출 : 런타임에러가 날확률이 높음, 지양해야 할 방법 

```swift
var myName : String? = "aa"

var myName2 : String = myName // 옵셔널이 아닌 변수에는 옵셔널이 들어갈 수 없음
var myName2 : String = myName!
```

<br>

* 옵셔널 바인딩 : 옵셔널에 값이 있는지 확인

```swift
if let name = myName, let age = myAge { // 옵셔널 바인딩을 통한 임시 상수 또는 변수 할당
    // nil이 아닐 때
}else{
    // nil 일때
}
```

<br>


* 암시적 추출 옵셔널 : 암시적 추출 옵셔널로 지정된 타입은 일반값처럼 사용할 수 있으나, nil도 할당가능, 그러나 할당시 런타임오류 발생

```swift
var myName: String! = "aaa"
myName = nil

if var name = myNaae{

}else{

}

```


