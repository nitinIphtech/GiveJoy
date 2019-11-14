//
//  StoreViewController.swift
//  GiveJoy
//
//  Created by Abhishek ranjan Dubey on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class StoreProductWiseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var noFilterBtn: CustomButton!
    @IBOutlet weak var filterBtn: CustomButton!
    
    var productCategoryArray = ["All", "HeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphonesHeadphones", "Speaker", "Microphones", "Headphones", "Speaker", "Microphones", "Speaker"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        self.filterBtn.backgroundColor = UIColor(hexString: "#2A1562")
        self.noFilterBtn.backgroundColor = UIColor.white
        
        self.filterBtn.setTitleColor(UIColor.white, for: .normal)
        self.noFilterBtn.setTitleColor(UIColor.black, for: .normal)

    }
    
    //MARK: CollectionView Delegate.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreProductWiseViewCell", for: indexPath) as! StoreProductWiseViewCell
            cell.itemName.text = productCategoryArray[indexPath.item]
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
            return cell
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionView {
            
            return CGSize(width: 200, height: 52)
        }
        else {
            let width = (collectionView.frame.width/2.0) - 5
            return CGSize(width: width, height: collectionView.frame.height/1.55)
        }

    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
