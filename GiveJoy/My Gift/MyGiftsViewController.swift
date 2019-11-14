//
//  StoreViewController.swift
//  GiveJoy
//
//  Created by Abhishek ranjan Dubey on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class MyGiftsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var filterBtn: CustomButton!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        self.filterBtn.backgroundColor = UIColor(hexString: "#FFB900")
        self.filterBtn.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
        self.filterBtn.setCornerRadius(radius: 14.0)

    }
    
    //MARK: CollectionView Delegate.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
            return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let width = (collectionView.frame.width/2.0)
            return CGSize(width: width, height: 180)

    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func checkListButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "GiftListViewController") as! GiftListViewController
             self.navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
