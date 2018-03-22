//
//  FirstViewController.swift
//  CollectionSample
//
//  Created by Keun young Kim on 2018. 1. 16..
//  Copyright © 2018년 KxCoding. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {
   var list = [String]()
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
      
      let target = list[indexPath.row]
      cell.textLabel?.text = target
      
      return cell
   }
   

   @IBOutlet weak var inputField: UITextField!
   
   @IBOutlet weak var listTableView: UITableView!
   
   @IBAction func addElement(_ sender: Any) {
      guard let inputValue = inputField.text, inputValue.count > 0 else {
         return
      }
      
      list.append(inputValue)
      
      // reload table
      listTableView.reloadData()
      
      // reset input field
      inputField.text = nil // or ""
      
      // dismiss keyboard
      inputField.resignFirstResponder()
      
      print("appended")
   }
   
   
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
      
   }


}

