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

상세한 내용은 별도의 서류로 제출하되, 이 표에는 아이디어(사업) 내용을 요약하여 
제시(구현기술, 서비스방법, 사업화 가능성 및 기대효과 등 위주로 작성)


# View as : IPhone 8(wC hR)

- Vary for Traits : 화면 커스터마이징