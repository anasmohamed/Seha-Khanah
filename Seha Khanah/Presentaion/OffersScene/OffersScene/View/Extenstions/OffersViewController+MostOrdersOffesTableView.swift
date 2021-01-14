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
    func getMostOrderedOffersSuccess() {
//       imageSlider.auk.settings.contentMode = .scaleAspectFill
//               for image in labDetails.labPhotos
//               {
//                   labImages.auk.show(url: image)
//                   
//               }
//               imageSlider.auk.startAutoScroll(delaySeconds: 3)
        mostOrderOffersTableView.reloadData()
    }
    func setupMostOrderedOffersTableView() {
        mostOrderOffersTableView.register(UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil), forCellReuseIdentifier: "MostOrderedOffersTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostOrderedOffersPresenter.getMostOrderedOfferCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostOrderedOffersTableViewCell", for: indexPath) as! MostOrderedOffersTableViewCell
        cell.leftInset = 20
          cell.rightInset = 20
        mostOrderedOffersPresenter.configure(cell: cell, for: indexPath.row)
               return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
   
}
