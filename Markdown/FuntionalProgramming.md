# Map

> 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수, 기존의 데이터를 변현하는데 주로사용함


```swift
let numbers = [Int] = [0,1,2,3,4]
var doubleNum
/*기본 클로저 표현식*/
doubleNum = numbers.map({(number:Int) -> Int in return number*2})

/*매개변수 및 반환 타입 생략*/
doubleNum = numbers.map({return $0*2})

/*반환 키워드 생략*/
doubleNum = number.map({$0 * 2})

/*후행 클로저 사용*/
doubleNum = number.map{$0 * 2}
```

<br>

---

# filter

> 컨테이너 내부의 값을 걸러서 추출하는 역할을 하는 고차함수

```swift
let number : [Int] = [0,1,2,3,4,5]

let evenNUmber : [Int] = number{ $0 % 2 != 0}
```

# reduce 

> 종합해서 반환하는 메서드

```swift
var sum: Int = numbers.reduce(0, {(result:Int, elemenet:Int)-> Int in 
    print("\(result) + \(elemenet)")
    return result + elemenet
})

sum = numbers.reduce(into : 0, {(result : inout Int, element:Int) in  // reduce(into: _:) 사용
    print("\(result)+\(element)")
    result += element
})
```


