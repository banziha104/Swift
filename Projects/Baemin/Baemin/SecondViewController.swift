//
//  SecondViewController.swift
//  Baemin
//
//  Created by Keun young Kim on 2018. 2. 5..
//  Copyright © 2018년 Keun young Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
   @IBOutlet weak var headerBackgroundView: UIView!
   
   @IBOutlet weak var whiteBackButton: UIButton!
   
   @IBOutlet weak var blackBackButton: UIButton!
   
   @IBOutlet weak var titleLabel: UILabel!
   
   @IBOutlet weak var height: NSLayoutConstraint!
   
   @IBOutlet weak var listTableView: UITableView!
   
   
   var barStyle: UIStatusBarStyle = .default
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return barStyle
   }
   
   
   @IBAction func moveToBack(_ sender: Any) {
      navigationController?.popViewController(animated: true)
   }
   
   
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        headerBackgroundView.alpha = 0
      blackBackButton.alpha = 0
      whiteBackButton.alpha = 1
      titleLabel.alpha = 0
      
      listTableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
      listTableView.scrollIndicatorInsets = listTableView.contentInset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension SecondViewController: UIScrollViewDelegate {
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let y = scrollView.contentOffset.y
      
      if (y < 0) {
         barStyle = .lightContent
         UIView.animate(withDuration: 0.3, delay: 0.0, options: .beginFromCurrentState, animations: {
            self.headerBackgroundView.alpha = 0
            self.blackBackButton.alpha = 0
            self.whiteBackButton.alpha = 1
            self.titleLabel.alpha = 0
         }, completion: nil)
         
      } else {
         barStyle = .default
         UIView.animate(withDuration: 0.3, delay: 0.0, options: .beginFromCurrentState, animations: {
            self.headerBackgroundView.alpha = 1
            self.blackBackButton.alpha = 1
            self.whiteBackButton.alpha = 0
            self.titleLabel.alpha = 1
         }, completion: nil)
      }
      
      setNeedsStatusBarAppearanceUpdate()
   }
}






extension SecondViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "dummy")!
      
      return cell
   }
}


extension SecondViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 3000
   }
}





























