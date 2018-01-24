# 라벨 text watching

```swift
extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // string은 길이를 말

        return true // 키보드에 입력할 때마다 이전의 입력된 값을 리턴함()
    }
}

```

# replacingCharacters(in: NSRange, with: String)