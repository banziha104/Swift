# 프로토콜

> 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진, 인터페이스와 비슷

- 정의

```swift
protocol 프로토콜 이름{
    프로토콜 정의
}

protocol ExProtocol{
    /*프로퍼티 요구*/
    var settableProperty : String {set} // 셋만
    var notNeedSettableProperty : String {get} //겟만
    
    /*이니셜라이저 요구*/
    init(name : String)
    
    /*메서드 요구*/
    func receieved(data : Any, url : String)
    mutating func reset() // 가변 메서드 요구
}
```

- 클래스 전용 프로토콜

```swift
protocol ClassOnlyProtocol : class, Readable, Writeable{ // 클래스를 가장 앞에 써줌

}
```