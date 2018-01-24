//
//  ViewController.swift
//  SlackUI
//
//  Created by leeyoungjoon on 2018. 1. 24..
//  Copyright © 2018년 leeyoungjoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

                UIView.animate(withDuration: 0.3, animations: {
                    self.bottomConstraint.constant = height + 20
                    self.view.layoutIfNeeded()
                })
            }
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

