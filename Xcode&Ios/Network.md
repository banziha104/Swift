
# Network


```swift
//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// 플레이그라운드 무한실행
PlaygroundPage.current.needsIndefiniteExecution = true

// URL String 설정
let urlStr = "https://fastcampus.azurewebsites.net/api/string"

// URL 객체로 변경
if let url = URL(string: urlStr){
    // 네트워크를 위해 세션객체 생성
    let session = URLSession(configuration: .default)

    // 데이터 테스크 정의
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error{
            print(error)
        }else{
            if let responseData = data {
                let str = String(data: responseData, encoding: .utf8)
                print(str)
            }
        }
    })

    // 태스크실행
    task.resume()

    // 플레이그라운드종료
    PlaygroundPage.current.finishExecution()
}
```

- 모델

```swift
// Codable을 붙여줌으로써 직렬화 가능
struct Book : Codable{
    let id: Int
    let title : String
    let desc: String
    let pubYear : Int
}
```