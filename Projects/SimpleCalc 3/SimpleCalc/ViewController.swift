//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Keun young Kim on 2018. 1. 11..
//  Copyright © 2018년 KxCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var leftInputField: UITextField!
   
   @IBOutlet weak var opInputField: UITextField!
   
   @IBOutlet weak var rightInputField: UITextField!
   
   @IBAction func performCalc(_ sender: Any) {
      guard let leftStr = leftInputField.text, leftStr.count > 0, let leftNum = Int(leftStr) else {
         displayAlert(title: "오류", msg: "정수로 변환 가능한 값을 입력해 주세요!")
         return
      }
      
      guard let rightStr = rightInputField.text, rightStr.count > 0, let rightNum = Int(rightStr) else {
         displayAlert(title: "오류", msg: "정수로 변환 가능한 값을 입력해 주세요!")
         return
      }
      
      guard let op = opInputField.text, op.count > 0 else {
         displayAlert(title: "오류", msg: "연산자를 입력해 주세요!")
         return
      }
      
      var result = 0
      
      switch op {
      case "+":
         result = leftNum + rightNum
      case "-":
         result = leftNum - rightNum
      case "*":
         result = leftNum * rightNum
      case "/":
         result = leftNum / rightNum
      default:
         displayAlert(title: "경고", msg: "지원하지 않는 연산자!~")
         return
      }
      
      displayAlert(title: "결과", msg: "\(leftNum) \(op) \(rightNum) = \(result)")
   }
   
   func displayAlert(title: String, msg: String) {
      let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
      
      let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
      alert.addAction(okAction)
      
      present(alert, animated: true, completion: nil)
   }
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
}

