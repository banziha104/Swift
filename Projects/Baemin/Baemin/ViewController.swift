//
//  ViewController.swift
//  Baemin
//
//  Created by Keun young Kim on 2018. 1. 31..
//  Copyright © 2018년 Keun young Kim. All rights reserved.
//

import UIKit

struct Course {
   let title: String
   let imageName: String
   let startDate: Date
   let endDate: Date
   let tags: [String]
   let location: String
}

class ViewController: UIViewController {
   var courseList = [
      Course(title: "Swift4를 활용한 iOS 앱 개발 CAMP", imageName: "course0", startDate: Date(), endDate: Date(), tags: ["iOS", "Swift4"], location: "리틀스타 10-A"),
      Course(title: "나만의 iOS 앱 개발 입문 CAMP", imageName: "course1", startDate: Date(), endDate: Date(), tags: ["iOS", "Swift4"], location: "리틀스타 10-A"),
      Course(title: "Unity 5 게임 제작 CAMP", imageName: "course2", startDate: Date(), endDate: Date(), tags: ["iOS", "Swift4"], location: "리틀스타 10-A"),
      Course(title: "JavaScript 정복 프로젝트 CAMP", imageName: "course3", startDate: Date(), endDate: Date(), tags: ["iOS", "Swift4"], location: "리틀스타 10-A"),
      Course(title: "Node.js로 구현하는 쇼핑몰 프로젝트 CAMP", imageName: "course4", startDate: Date(), endDate: Date(), tags: ["iOS", "Swift4"], location: "리틀스타 10-A")
   ]

   @IBOutlet weak var firstButton: UIButton!
   
   @IBOutlet weak var center1: NSLayoutConstraint!
   
   @IBOutlet weak var center2: NSLayoutConstraint!
   
   @IBOutlet weak var center3: NSLayoutConstraint!
   
   @IBOutlet weak var center4: NSLayoutConstraint!
   
   @IBOutlet weak var center5: NSLayoutConstraint!
   
   @IBOutlet weak var width: NSLayoutConstraint!
   
   @IBOutlet weak var bannerCollectionView: UICollectionView!
   
   @IBOutlet weak var courseCollectionView: UICollectionView!
   
   
   lazy var df: DateFormatter = {
      let f = DateFormatter()
      f.dateFormat = "M월 d일(E)"
      return f
   }()
   
   @IBAction func selectMenu(_ sender: UIButton) {
      center1.isActive = sender.tag == 100
      center2.isActive = sender.tag == 200
      center3.isActive = sender.tag == 300
      center4.isActive = sender.tag == 400
      center5.isActive = sender.tag == 500
      
      let dict = [NSAttributedStringKey.font: sender.titleLabel!.font!]
      
      var targetWidth: CGFloat = 100
      if let text = sender.title(for: .normal) {
         targetWidth = (text as NSString).size(withAttributes: dict).width
      }
      
      width.constant = targetWidth
      
//      UIView.animate(withDuration: 0.3) {
//         self.view.layoutIfNeeded()
//      }
      
      UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
         self.view.layoutIfNeeded()
      }, completion: nil)
      
      
      for _ in 0...10 {
         let a = arc4random_uniform(UInt32(courseList.count))
         let b = arc4random_uniform(UInt32(courseList.count))
         courseList.swapAt(Int(a), Int(b))
      }
      
      courseCollectionView.reloadData()
   }
   
   
   
   
   
   
   
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      selectMenu(firstButton)
   }

   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      let targetIndexPath = IndexPath(item: 5000, section: 0)
      bannerCollectionView.selectItem(at: targetIndexPath, animated: false, scrollPosition: .centeredHorizontally)
      
      resumeTimer()
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      timer?.suspend()
   }
   
   var timer: DispatchSourceTimer?
   
   func resumeTimer() {
      if timer == nil {
         timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
         timer?.schedule(deadline: .now() + 5, repeating: 5.0)
         timer?.setEventHandler(handler: {
            if var currentIndexPath = self.bannerCollectionView.indexPathsForVisibleItems.first {
               currentIndexPath.item += 1
               self.bannerCollectionView.selectItem(at: currentIndexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
         })
      }
      
      timer?.resume()
   }

}





extension ViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if collectionView == bannerCollectionView {
         return 10000
      }
      
      return courseList.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      if collectionView == bannerCollectionView {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCollectionViewCell
         
         let imgName = "banner\(indexPath.item % 5)"
         
         cell.bannerImageView.image = UIImage(named: imgName)
         
         return cell
      }
      
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CourseCollectionViewCell
      
      let target = courseList[indexPath.item]
      cell.courseImageView.image = UIImage(named: target.imageName)
      cell.titleLabel.text = target.title
      
      if let start = df.string(for: target.startDate), let end = df.string(for: target.endDate) {
         cell.dateLabel.text = "\(start) ~ \(end)"
      }
      
      let tagString = "#" + target.tags.joined(separator: " #")
      cell.tagLabel.text = tagString
      
      cell.locationLabel.text = target.location
      
      
      return cell
      
      
      
      
   }
   
   
}





extension ViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      if collectionView == bannerCollectionView {
         return collectionView.frame.size
      }
      
      let width = (collectionView.bounds.width - 30) / 2
      let height = width * 1.5
      return CGSize(width: width, height: height)
   }
}



















