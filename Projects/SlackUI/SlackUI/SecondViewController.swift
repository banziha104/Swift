//
//  SecondViewController.swift
//  SlackUI
//
//  Created by Keun young Kim on 2017. 11. 17..
//  Copyright © 2017년 KxCoding. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
   // 첫 번째 화면에서 입력된 url 문자열을 전달받습니다.
   var urlString: String?

   // 텍스트 입력 상태에 따라서 alpha 속성을 변경하기 위해서
   @IBOutlet weak var titleLabel: UILabel!
   
   // 텍스트 입력 상태에 따라서 y 좌표를 변경하기 위해서
   @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
   
   // 텍스트 입력 상태에 따라서 alpha 속성을 변경하기 위해서
   @IBOutlet weak var placeholderLabel: UILabel!
   
   
   @IBAction func moveToPrev(_ sender: Any) {
      // 이전 화면으로 이동
      navigationController?.popViewController(animated: true)
   }
   
   
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      // titleLabel에 초기 위치를 설정합니다.
      // 초기에는 화면에 표시되지 않고 텍스트 필드 세로 중앙에 위치합니다.
      // 입력이 시작되면 화면에 표시되고 텍스트 필드 위로 이동합니다.
      // 플레이스 홀더가 표시되면(즉, 이메일이 입력되지 않은 상태에서는) 사라져야 합니다.
      titleLabelBottomConstraint.constant = -20
      titleLabel.alpha = 0.0
      

        // 실제로 값이 넘어오는지 확인합니다.
      print(urlString)
    }


}

// 모두 애니메이션이 적용되지 않은 상태입니다.
// 애니메이션을 적용하겠습니다


extension SecondViewController: UITextFieldDelegate {
   // 편집이 시작되기 직전에 호출됩니다.
   // true를 리턴하면 편집 허용
   // false를 리턴하면 편집 금지
   func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
      // 플레이스홀더 업데이트
      // 항상 현재 문자열의 길이를 고려해야 합니다.
      
      UIView.animate(withDuration: 0.3) {
         self.placeholderLabel.alpha = (textField.text ?? "").count > 0 ? 0.0 : 1.0
      }
      
      
      return true
   }
   
   // 편집이 종료되기 직전에 호출됩니다.
   // true를 리턴하면 편집 종료 허용
   // false를 리턴하면 편집 종료 금지
   func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      // 플레이스홀더 업데이트
      // 항상 현재 문자열의 길이를 고려해야 합니다.
      UIView.animate(withDuration: 0.3) {
         self.placeholderLabel.alpha = (textField.text ?? "").count > 0 ? 0.0 : 1.0
      }
      
      return true
   }
   
   // 현재는 시작 직전과 종료 직전만 처리하기 때문에 텍스트를 입력할 때 플레이스홀더가 정상적으로 사라지지 않습니다.
   // 해결
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
      // 이 시점에서는 입력/삭제가 반영되기 전이기 때문에 최종 문자열을 구성해야 합니다
      var finalText = textField.text ?? ""
      if string.count == 0 {
         finalText = String(finalText[..<finalText.index(before: finalText.endIndex)])
      } else {
         finalText = finalText.appending(string)
      }
      
      
      // 플레이스홀더 업데이트
      // 텍스트 미입력시 : 표시
      // 텍스트 입력시 : 숨기기
      UIView.animate(withDuration: 0.3) {
         if finalText.count == 0 {
            self.placeholderLabel.alpha = 1.0
            
            self.titleLabelBottomConstraint.constant = -20
            self.titleLabel.alpha = 0.0
         } else {
            self.placeholderLabel.alpha = 0.0
            
            self.titleLabelBottomConstraint.constant = 20
            self.titleLabel.alpha = 1.0
         }
         
         self.view.layoutIfNeeded()
      }
      
      // Done :)
      
      return true
   }
   
   // 리턴키를 누를 경우 편집을 종료하도록 구현
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
}
























