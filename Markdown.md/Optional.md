# 옵셔널

> 스위프트의 특징 중하나인 안정성을 문법으로 담보하는 기능, 변수나 상수의 값이 nil 일 수도 있다는 것. <br>
> 매개변수를 굳이 넘기지 않아도 된다는 개념과 비슷함.



```swift
var myName : String = "aa"
myName = nil //에러

var myName2 : String? = "bb"
myName = nil // 에러가 안남
```

<br>

---

# 옵셔널 추출

> 옵셔널의 값을 옵셔널이 아닌 값으로 추출

* 강제 추출 : 런타임에러가 날확률이 높음

```swift
var myName : String? = "aa"

```