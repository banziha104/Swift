# 익스텐션 

> 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있음 

```swift
extension 확장할 타입 이름 {
 // 타입에 추가될 새로운 기능 구현
}

extension Int {
    /*프로퍼티 추가*/
    var isEven : Bool {
        return self % 2 == 0
    }
    var isOdd : Bool{
        return self % 2 == 1
    }
    
    /*메소드 추가*/
    func mutiply(by n : Int) -> Int {
        return self * n
    }
    
    /*이니셜라이저 추가*/
    init(center : Point, size : Size){
        init(center : Point , size : Size){
            let originX : Double = center.x - (size.width /2)
        }
    }
    
    /*서브 스크립트 추가*/
    subscript(appedValue : String) -> String{
        return self + appedValue
    }
}
```