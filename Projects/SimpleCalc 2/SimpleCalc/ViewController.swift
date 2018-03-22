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
   
   func processResult() -> String? {
      guard let leftStr = leftInputField.text, leftStr.count > 0, let leftNum = Int(leftStr) else {
         displayAlert(title: "오류", msg: "정수로 변환 가능한 값을 입력해 주세요!")
         return nil
      }
      
      guard let rightStr = rightInputField.text, rightStr.count > 0, let rightNum = Int(rightStr) else {
         displayAlert(title: "오류", msg: "정수로 변환 가능한 값을 입력해 주세요!")
         return nil
      }
      
      guard let op = opInputField.text, op.count > 0 else {
         displayAlert(title: "오류", msg: "연산자를 입력해 주세요!")
         return nil
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
         return nil
      }
      
      return "\(leftNum) \(op) \(rightNum) = \(result)"
   }
   
   @IBAction func performCalc(_ sender: Any) {
      guard let msg = processResult() else { return }
      
      displayAlert(title: "결과", msg: msg)
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
   
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let vc = segue.destination as? ResultViewController {
         vc.msg = processResult()
      }
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}

