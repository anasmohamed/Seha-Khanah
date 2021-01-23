//
//  OffersViewController+MostOrdersOffesTableView.swift
//  Seha Khanah
//
//  Created by Anas on 12/20/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
extension OffersViewController : UITableViewDelegate,UITableViewDataSource,MostOrderedOffersViewProtocol{
    func getMostOrderedOffersImageSuccess(images: [MostOrderedOffersImage]) {
        imageSlider.auk.settings.contentMode = .scaleAspectFill
        
        if locale == "en"
        {
            for image in images
            {
                imageSlider.auk.show(url: image.imageEn!)
                
            }
        }
        else{
            for image in images
            {
                imageSlider.auk.show(url: image.imageAr!)
                
            }
        }
        
        imageSlider.auk.startAutoScroll(delaySeconds: 3)
    }
    
    func getMostOrderedOffersSuccess() {
        indicator.stopAnimating()
        
        mostOrderOffersTableView.reloadData()
    }
    func setupMostOrderedOffersTableView() {
        mostOrderOffersTableView.register(UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil), forCellReuseIdentifier: "MostOrderedOffersTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostOrderedOffersPresenter.getMostOrderedOfferCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let offerDetailsViewController = UIStoryboard.init(name: "OfferDetails", bundle: nil).instantiateViewController(withIdentifier: "OfferDetailsViewController") as! OfferDetailsViewController
        offerDetailsViewController.id = presenter.getOfferId(index: indexPath.row)
        self.navigationController!.pushViewController(offerDetailsViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostOrderedOffersTableViewCell", for: indexPath) as! MostOrderedOffersTableViewCell
        cell.leftInset = 20
        cell.rightInset = 20
        mostOrderedOffersPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
}
