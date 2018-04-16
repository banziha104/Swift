//
//  ExtensionControl.swift
//  Sopt3Week
//
//  Created by 이영준 on 2018. 4. 14..
//  Copyright © 2018년 이영준. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}
extension UIViewController{
    func gsno(_ value : String?) -> String {
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        if let _value = value {
            return _value
        }else {
            return 0
        }
    }
}
