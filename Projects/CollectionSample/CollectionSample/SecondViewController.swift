//
//  SecondViewController.swift
//  CollectionSample
//
//  Created by Keun young Kim on 2018. 1. 16..
//  Copyright © 2018년 KxCoding. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   @IBOutlet weak var keyField: UITextField!
   
   @IBOutlet weak var valueField: UITextField!
   
   @IBOutlet weak var listTableView: UITableView!
   
   var dict = [String: Int]()
   var keys: [String]?
   
   @IBAction func appendElement(_ sender: Any) {
      guard let keyStr = keyField.text, keyStr.count > 0 else {
         return
      }
      
      guard let valueStr = valueField.text, valueStr.count > 0, let num = Int(valueStr) else {
         return
      }
      
      dict[keyStr] = num
      keys = Array(dict.keys).sorted()
      
      listTableView.reloadData()
      keyField.text = nil
      valueField.text = nil
      
      if keyField.isFirstResponder {
         keyField.resignFirstResponder()
      }
      
      if valueField.isFirstResponder {
         valueField.resignFirstResponder()
      }
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

}







extension SecondViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return keys?.count ?? 0
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
      
      if let targetKey = keys?[indexPath.row], let targetValue = dict[targetKey] {
         
         cell.textLabel?.text = "\(targetKey)"
         
         // interger => string         
         cell.detailTextLabel?.text = "\(targetValue)"
      }
      
      return cell
   }
}



















