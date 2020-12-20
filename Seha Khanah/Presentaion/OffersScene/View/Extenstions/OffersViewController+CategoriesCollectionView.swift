//
//  OffersViewController+CategoriesCollectionView.swift
//  Seha Khanah
//
//  Created by Anas on 12/20/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
extension OffersViewController :UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func setupCollectionView() {
        offersCategoriesCollectionView.register(UINib(nibName: "OfferCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCategoriesCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0
        {
            return  1
        }
        return presenter.getOffersCategoriesCount() - 1
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCategoriesCollectionViewCell.identifier, for: indexPath) as! OfferCategoriesCollectionViewCell
        presenter.configure(cell: cell, for: indexPath.row,section:indexPath.section)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.section == 0 {
            // First section
            width = collectionView.frame.width/2
            height = 200
            return CGSize(width: width, height: height)
        } else {
            // Second section
            width = collectionView.frame.width/3
            height = 100
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionViewLayoutInsets()  {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
             layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: offersCategoriesCollectionView.frame.height/3, height: offersCategoriesCollectionView.frame.height/3)
             layout.minimumInteritemSpacing = 0
             layout.minimumLineSpacing = 10
             offersCategoriesCollectionView.collectionViewLayout = layout
    }
}
