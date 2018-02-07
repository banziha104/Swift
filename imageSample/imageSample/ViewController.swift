//
//  ViewController.swift
//  imageSample
//
//  Created by leeyoungjoon on 2018. 1. 29..
//  Copyright © 2018년 leeyoungjoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let imgView = cell.viewWithTag(100) as? UIImageView {
            let imgName = "img\(indexPath.item % 4)"
            imgView.image = UIImage(named: imgName)
        }
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else{
            return CGSize.zero
            
        }
        var cellSize = CGSize.zero
        cellSize.width = (collectionView.bounds.width - layout.minimumInteritemSpacing) / 2.0
        cellSize.height = (collectionView.bounds.width - layout.minimumInteritemSpacing) / 2.0
        
        return cellSize
    }
}

