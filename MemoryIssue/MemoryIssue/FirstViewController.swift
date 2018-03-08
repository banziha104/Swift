//
//  FirstViewController.swift
//  MemoryIssue
//
//  Created by Keun young Kim on 2018. 3. 6..
//  Copyright © 2018년 Keun young Kim. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
   
   class Person {
      var name = "John doe"
      var car: Car?
      
      deinit {
         print("Person is being deinitialized")
      }
   }
   
   class Car {
      var model = "Porsche 911"
      var owner: Person?
      
      deinit {
         print("Car is being deinitialized")
      }
   }

   
   
   
   var person: Person? = Person()
   var car: Car? = Car()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.      
      
      person?.car = car
      car?.owner = person
   }
   
   
   deinit {
      print("\(self) is being deinitialized")
   }
}
