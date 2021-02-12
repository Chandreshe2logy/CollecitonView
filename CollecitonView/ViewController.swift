//
//  ViewController.swift
//  CollecitonView
//
//  Created by chandresh on 18/03/20.
//  Copyright © 2020 chandresh. All rights reserved.
//

import UIKit

class  collectionLabel: UICollectionViewCell {
    
    @IBOutlet var lblName: UILabel!
}

class ViewController: UIViewController {
    @IBOutlet var colleciotnViewLabel: UICollectionView!
    @IBOutlet var heightOfCollectionView: NSLayoutConstraint!
    var arrColleciton : [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    override func viewDidLoad() {
        super.viewDidLoad()
        heightOfCollectionView.constant = UIScreen.main.bounds.width
        let pageHorizontalLayout : KSTCollectionViewPageHorizontalLayout = KSTCollectionViewPageHorizontalLayout()
        let screenWidth = UIScreen.main.bounds.width
        print(screenWidth)
        let finalwidth = screenWidth/2 - 10
        pageHorizontalLayout.itemSize = CGSize.init(width:finalwidth, height: finalwidth)
        pageHorizontalLayout.lineSpacing = 10
        pageHorizontalLayout.columnCount = 2
        pageHorizontalLayout.interitemSpacing = 10
        pageHorizontalLayout.sectionInsetTop = 10
        colleciotnViewLabel.collectionViewLayout = pageHorizontalLayout
        colleciotnViewLabel.isPagingEnabled = true
        colleciotnViewLabel.dataSource = self
        colleciotnViewLabel.delegate = self
        colleciotnViewLabel.reloadData()

    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColleciton.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :collectionLabel = (colleciotnViewLabel.dequeueReusableCell(withReuseIdentifier: "collectionLabel", for: indexPath) as? collectionLabel)!
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor.gray
        cell.lblName.text = arrColleciton[indexPath.row]
        return cell

    }
    
    
}
