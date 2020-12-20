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
        mostOrderedOffersPresenter.configure(cell: cell, for: indexPath.row)
               return cell
    }
    
    
}
