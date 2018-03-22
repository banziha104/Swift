//
//  ViewController.swift
//  SlackUI
//
//  Created by Keun young Kim on 2017. 11. 17..
//  Copyright © 2017년 KxCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   // 활성화 상태를 코드로 변경하기 위해서
   @IBOutlet weak var nextButton: UIButton!
   
   // 버튼을 탭했을 때, 코드를 통해 다음 화면으로 이동하기 위해서
   @IBAction func onNext(_ sender: Any) {
   }
   
   // 키보드 이벤트에 따라서 bottom 여백을 조절하기 위해서
   @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
   
   // 텍스트 입력 상태에 따라서 플레이스홀더 문자열을 변경하기 위해서
   @IBOutlet weak var placeholderLabel: UILabel!
   
   // 텍스트 입력 상태에 따라서 플레이스홀더 레이블의 x 위치를 변경하기 위해서
   @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
   
   // 폰트 속성을 읽기 위해서
   @IBOutlet weak var inputField: UITextField!
   
   
   // Segue가 실행되기 직전에 대상 뷰컨트롤러를 확인하고
   // SecondVC라면 조금 전에 추가한 urlString 속성에 입력된 URL 문자열을 할당합니다
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // destination 속성의 자료형이 UIViewController이기 때문에 실제 클래스로 다운캐스팅 해야 합니다.
      if let destVC = segue.destination as? SecondViewController {
         // .slack.com은 플레이스홀더에만 있을 뿐 실제 입력값에는 없습니다.
         // 그래서 명시적으로 뒤에 연결해 줍니다
         destVC.urlString = (inputField.text ?? "") + ".slack.com"
      }
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // 시작과 동시에 키보드 표시 = 대상 텍스트필드를 first responder로 만들기
      inputField.becomeFirstResponder()
      
      // 시뮬레이터에서 키보드가 표시되지 않는다면 Command + K 로 토글할 수 있습니다. 
      
      // 키보드 이벤트 처리
      NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (noti) in
         // 키보드가 표시되기 직전에 호출됩니다
         
         // 키보드 높이 얻기
         // 키보드 크기 정보는 noti.userInfo 딕셔너리에 UIKeyboardFrameEndUserInfoKey 키로 저장되어 있고, 실제 값의 형식은 NSValue입니다. 이 값이 제공하는 cgRectValue 속성을 통해 CGFrame으로 변경할 수 있습니다.
         if let frameValue = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardFrame = frameValue.cgRectValue
            
            // 키보드 높이에 추가 여백(20)을 더합니다.
            self.bottonConstraint.constant = keyboardFrame.size.height + 20
            
            UIView.animate(withDuration: 0.3, animations: {
               // 여기에 코드를 넣으면 자동으로 애니메이션 효과가 적용됩니다.
            
               // 매우 중요!
               // 레이아웃 업데이트를 요청합니다.
               self.view.layoutIfNeeded()
            })
         }
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (noti) in
         self.bottonConstraint.constant = 20
         
         UIView.animate(withDuration: 0.3, animations: {
            // 여기에 코드를 넣으면 자동으로 애니메이션 효과가 적용됩니다.
            
            // 매우 중요!
            // 레이아웃 업데이트를 요청합니다.
            self.view.layoutIfNeeded()
         })
      }
   }
}


extension ViewController: UITextFieldDelegate {
   // 텍스트 필드에 텍스트를 입력하거나 삭제할 때마다 호출
   // true를 리턴하면 입력/삭제한 텍스트가 반영되고 false를 리턴하면 무시
   // 입력일 경우 세 번째 파라미터로 입력된 문자열이 전달되고, 삭제일 경우에는 빈 문자열이 전달되므로 문자열 길이를 통해서 삭제인지 입력인지 확인할 수 있음.
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
      // 이 시점에서는 입력/삭제가 반영되기 전이기 때문에 최종 문자열을 구성해야 합니다
      var finalText = textField.text ?? ""
      if string.count == 0 {
         finalText = String(finalText[..<finalText.index(before: finalText.endIndex)])
      } else {
         finalText = finalText.appending(string)
      }
      
      // 플레이스홀더 왼쪽 여백 업데이트
      // 구조체 형식의 String을 클래스 형식의 NSString으로 변환합니다
      // Why? 입력된 문자열의 너비를 구하기 위해서 => NSString 클래스는 여기에 필요한 메소드를 제공하기 때문에
      let nsStr = NSString(string: finalText)
      
      // 문자열의 너비는 폰트를 기준으로 계산됩니다
      // 그래서 텍스트필드에 설정되어 있는 폰트를 얻은 다음 크기 계산 메소드로 전달해야 합니다
      // 이 때는 딕셔너리 형태로 전달합니다
      // NSAttributedStringKey에는 문자열과 관련된 속성을 구성할 때 사용할 키가 선언되어 있습니다
      let dict = [NSAttributedStringKey.font: inputField.font!] // 폰트 속성은 항상 nil이 아니기 때문에(직접 코드로 nil을 할당하지 않는다면) 강제 추출해도 문제가 없습니다
      
      let width = nsStr.size(withAttributes: dict).width
      
      // 계산된 너비를 플레이스홀더의 왼쪽 여백 제약의 constant 값으로 할당
      leadingConstraint.constant = width
      
      
      // 플레이스홀더 업데이트
      // 텍스트 미입력시 : your-url.slack.com
      // 텍스트 입력시 : .slack.com
      if finalText.count == 0 {
         placeholderLabel.text = "your-url.slack.com"
      } else {
         placeholderLabel.text = ".slack.com"
      }
      
      // 논리적인 오류를 해결하기 위해서 string을 모두 finalText로 바꿉니다
      // 그러면 입력, 삭제가 적용된 최종 문자열을 기준으로 코드가 분기되기 때문에 논리적인 오류가 발생하지 않습니다
      
      // 버튼 활성화 상태 토글
      if finalText.count == 0 { // 삭제면
         nextButton.isEnabled = (textField.text ?? "").count - 1 > 0
         // 이 시점에서는 실제로 삭제가 반영되지 않은 상태이므로 길에서 1을 빼 주어야 실제 삭제 후의 길이를 얻을 수 있습니다
      } else { // 입력이면
         nextButton.isEnabled = (textField.text ?? "").appending(string).count > 0
         // 이 시점에서는 입력된 문자가 문자열에 반영되지 않은 상태이므로 입력된 텍스트에 세 번째 파라미터로 전달된 문자열을 붙여야 최종 문자열을 얻을 수 있습니다
      }
      
      return true
   }
}
