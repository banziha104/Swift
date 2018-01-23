- cmd + b : 빌드 (뷰 세팅 저장)



# Sender

> UI Action 상에서 발생한 모든 것을 코드상에서 받는 객체

```swift
@IBAction func dateChanged(_ sender: Any) {

    }
```

# ViewTagging

> 정수로 태그를 주어 코드상에서 해당 정수로 바인딩할 수 있음.
><br> 어트리뷰트 인스펙터 > view > tag


```swift
if let picker = view.viewWithTag(100) as? UIDatePicker{
            resultLabel.text = Date().diffString(for: picker.date)   
        }
```

# 강제로 오류 발생 시키기

> 디버깅에서 오류 보기 편함

```swift
fatalError("텍스트 입력 오류")
```