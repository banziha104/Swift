# 메모리 누수 관리

- unowned
- weak
- closure capture list = 클로져를 약한 참조로 바꾸어 메모리 누수를 줄임

```swift
    /*weak나 unowned를 사용해야하지만 weak는 optional binding을 해주어야*/
   lazy var gasMileage: () -> Double = { [unowned self] (someInput) in // [unowned self] 를 붙여 줌으로써 약한 참조로 변경
      return self.totalDistance / self.totalGas   // 옵셔널로 접근해야함
   }
   
   /*weak 사용*/
           Alamofire.request(url).responseJSON { [weak self] (response) in
               guard let strongSelf = self else {
    }
```

- cmd + i : profile = 메모리 릭을 포함한 다양한 프로파일 툴 제공
