# 새로운 화면 추가

1. 스토리보드 뷰컨트롤러  
2. 코코아터치 파일 생성
3. 뷰컨트롤러 상단 클릭
4. identity inspector 에서 class에 이름 추가

# 페이지 전환(세그웨이 사용)

1. 버튼 생성
2. 버튼 ctrl + 드래그로 세그웨이 생성

# 페이지 데이터 전달

- 전달할 페이지

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let source = segue.source; // 전달할 데이터
        let desc = segue.destination // 전환될 페이지 

        guard let text = inputField?.text, text.count > 0 else {
            return
        }
        guard let destVC = desc as? SecondViewController else{ // 업케스팅 되기 때문에 다운캐스팅을 해야함
            return
        }
        
        destVC.value = text
    }
```

- 전달 받는 페이지 

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = value
    }
```