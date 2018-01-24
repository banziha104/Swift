//
//  ViewController.swift
//  SlackUI
//
//  Created by leeyoungjoon on 2018. 1. 24..
//  Copyright © 2018년 leeyoungjoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
                forName: NSNotification.Name.UIKeyboardWillShow,
                object: nil, queue: OperationQueue.main) {
            (noti) in
            if let value = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = value.cgRectValue
                let height = keyboardFrame.height // 키보드

                self.bottomConstraint.constant = height + 20

                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main){
            (noti) in
            self.bottomConstraint.constant = 20

            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
//        DispatchQueue.main.asyncAfter(deadline : .now() + 2) { // 2초 뒤에 실행
//            UIView.animate(withDuration: 0.3, animations: {
//                self.bottomConstraint.constant = 100
//                self.view.layoutIfNeeded() // 뷰 갱신(필수)})
//            })
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // string은 길이를 말함, NSRange는 범위가 넘어옮
        var finalText = textField.text ?? ""
        if string.count == 0 {
            let startIndex = finalText.startIndex
            let endIndex = finalText.index(finalText.endIndex, offsetBy: -1)
            finalText = String(finalText[startIndex ..< endIndex])
        }else{
            finalText = finalText.appending(string) // finalText에 스트링이 계속 붙음
        }

        let nsstr = finalText as NSString // NSString으로 변환함
        let dict = [NSAttributedStringKey.font : inputField.font!]
        let width = nsstr.size(withAttributes: dict).width //
        leading.constant = width
        view.layoutIfNeeded() 
        return true // 키보드에 입력할 때마다 이전의 입력된 값을 리턴함()
    }
}
