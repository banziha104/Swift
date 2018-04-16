//
//  FriendsViewController.swift
//  Sopt3Week
//
//  Created by 이영준 on 2018. 4. 14..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    var fiends = [Profile]()
    var myProfile = Profile(name: "이영준", profileImage: nil, message: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTableView.refreshControl = UIRefreshControl()
        profileTableView.refreshControl?.addTarget(self, action: #selector(startReloadTableView(_:)), for: .valueChanged)
        profileTableView.tableFooterView = UIView(frame: .zero)
        getData()
        bindDelegateAndDataSoruce()
    }
    @objc func startReloadTableView(_ sender : UIRefreshControl){
        // 리프레쉬 할때 할 행동 구현
        profileTableView.reloadData()
        sender.endRefreshing()
    }
}

// Delegate
extension FriendsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 넘어가는거구현
    }
    

}

// Datasoruce
extension FriendsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.fiends.count
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "FriendsHeaderTableViewCell") as! FriendsHeaderTableViewCell
        
        if section == 0{
            header.labelTitle.text = "내 프로필"
        }else {
            header.labelTitle.text = "친구"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell") as! FriendsTableViewCell
        
        if indexPath.section == 0 {
            cell.labelName.text = myProfile.name
        } else {
            cell.configure(profile: fiends[indexPath.row])
        }
//        cell.imgProfile.image = UIImage(#imageLiteral(resourceName: "pikachu\(indexPath.row + 1)"))
    
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}


// Bind
extension FriendsViewController{
    func bindDelegateAndDataSoruce (){
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
    func getData() {
        let friend11 = Profile(name: "iOS 승수", profileImage: nil, message: nil)
        let friend12 = Profile(name: "iOS 수진", profileImage: nil, message: nil)
        let friend13 = Profile(name: "iOS 재림", profileImage: nil, message: nil)
        let friend14 = Profile(name: "iOS 예은", profileImage: nil, message: nil)
        let friend15 = Profile(name: "iOS 관용", profileImage: nil, message: nil)
        let friend16 = Profile(name: "iOS 성훈", profileImage: nil, message: nil)
        let friend17 = Profile(name: "iOS 세은", profileImage: nil, message: nil)
        let friend18 = Profile(name: "iOS 현호", profileImage: nil, message: nil)
        let friend19 = Profile(name: "iOS 주연", profileImage: nil, message: nil)
        let friend20 = Profile(name: "iOS 동규", profileImage: nil, message: nil)
        let friend21 = Profile(name: "iOS 어진", profileImage: nil, message: nil)
        let friend22 = Profile(name: "iOS 영준", profileImage: nil, message: nil)
        let friend23 = Profile(name: "iOS 지현", profileImage: nil, message: nil)
        let friend24 = Profile(name: "iOS 충신", profileImage: nil, message: nil)
        let friend25 = Profile(name: "iOS 용범", profileImage: nil, message: nil)
        let friend26 = Profile(name: "iOS 구일", profileImage: nil, message: nil)
        let friend27 = Profile(name: "iOS 기웅", profileImage: nil, message: nil)
        let friend28 = Profile(name: "iOS 초이", profileImage: nil, message: nil)
        let friend29 = Profile(name: "iOS 예은", profileImage: nil, message: nil)
        let friend30 = Profile(name: "iOS 덕원", profileImage: nil, message: nil)
        let friend31 = Profile(name: "iOS 예원", profileImage: nil, message: nil)
        let friend32 = Profile(name: "iOS 민하", profileImage: nil, message: nil)
        self.fiends.append(contentsOf: [friend11, friend12, friend13, friend14, friend15, friend16, friend17, friend18,
                                         friend19, friend20, friend21, friend22, friend23, friend24, friend25, friend26,
                                         friend27, friend28, friend29, friend30, friend31, friend32])
    }

}

