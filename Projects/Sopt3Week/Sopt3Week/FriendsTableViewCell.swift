//
//  FriendsTableViewCell.swift
//  Sopt3Week
//
//  Created by 이영준 on 2018. 4. 14..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = imgProfile.layer.frame.width/2
        
        imgProfile.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imgProfile.layer.borderWidth = 0.1
    }
    
    func configure(profile : Profile){
        imgProfile.image = profile.profileImage ?? #imageLiteral(resourceName: "defalut")
        labelName.text = profile.name
    }
}

