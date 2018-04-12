//
//  SecondViewController.swift
//  Sopt
//
//  Created by 이영준 on 2018. 3. 31..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var tfPw: UITextField!
    @IBOutlet weak var tfID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
