//
//  ThirdViewController.swift
//  MemoryIssue
//
//  Created by Keun young Kim on 2018. 3. 6..
//  Copyright © 2018년 Keun young Kim. All rights reserved.
//

import UIKit

class Car {
   var totalDistance: Double = 0.0
   var totalGas: Double = 0.0
   
   lazy var gasMileage: () -> Double = { [ unowned self] in
      return self.totalDistance / self.totalGas
   }
   
   func drive() {
      self.totalDistance += Double(arc4random_uniform(1000) + 1000)
      self.totalGas += Double(arc4random_uniform(100) + 50)
   }
   
   deinit {
      print("Car is being deinitialized")
   }
}


class ThirdViewController: UIViewController {
   
   var myCar: Car? = Car()
   
   @IBAction func noLeak(_ sender: Any) {
      myCar?.drive()
   }
   
   @IBAction func leak(_ sender: Any) {
      myCar?.drive()
      print(myCar?.gasMileage() ?? 0.0)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   
   deinit {
      print("\(self) is being deinitialized")
   }
}
