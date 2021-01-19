//
//  AllCategoriesViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import DropDownTableView
class AllCategoriesViewController: DropDownTableViewController ,AllCategoriesProtocol{
    
    
    var presenter : AllCategoriesPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AllCategoriesPresenter(view:self)
        presenter.getOffersCategories()
       
        // Do any additional setup after loading the view.
    }
    override func numberOfRows(in tableView: UITableView) -> Int {
        return presenter.getOffersCategoriesCount()
    }
    override func tableView(_ tableView: UITableView, numberOfSubrowsInRow row: Int) -> Int {
        print("number or subrows \(presenter.getOfferSubCategoriesCount(index: row))")
        return presenter.getOfferSubCategoriesCount(index: row)
    }
    override var showSubrowsInRow: Int? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRow row: Int, indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCategoryCell", for: indexPath)
        cell.textLabel?.text = presenter.getOffersCategoryName(index: row)
        
        if row == self.nsk_selectedRow {
            
            cell.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
            
        } else {
            
            cell.accessoryView = UIImageView(image: UIImage(named: "down_arrow"))
        }
        
        return cell
    }
    //    override func tableView(_ tableView: UITableView, cellForRow row: Int, indexPath: IndexPath) -> UITableViewCell {
    //        if row == self.nsk_selectedRow {
    //            someCell.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
    //        } else {
    //            someCell.accessoryView = UIImageView(image: UIImage(named: "down_arrow"))
    //        }
    //        return someCell
    //    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRow row: Int) {
        
        switch (self.nsk_selectedRow, row) {
            
        case (let sr?, _) where row == sr:
            tableView.cellForRow(at: row)?.accessoryView =  UIImageView(image: UIImage(named: "down_arrow"))
            tableView.deselect(row: row, animated: true)
            break
            
        case (let sr?, _) where row != sr:
            tableView.cellForRow(at: row)?.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
            tableView.cellForRow(at: sr)?.accessoryView = UIImageView(image: UIImage(named: "down_arrow"))
            break
            
        case (nil, _):
            tableView.cellForRow(at: row)?.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
            break
            
        default:
            break
        }
        
        super.tableView(tableView, didSelectRow: row)
    }
    override func tableView(_ tableView: UITableView, cellForSubrow subrow: Int, inRow row: Int, indexPath: IndexPath) -> UITableViewCell {
         
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath)
        cell.textLabel?.text = presenter.getOffersSubCategoryName(index: row, subIndex: subrow)
         
         return cell
     }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return presenter.getOfferSubCategoriesCount(index: section)
    //    }
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return presenter.getOffersCategoriesCount()
    //    }
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
    //        return cell
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let button = UIButton()
    //        button.setTitle("Close", for: .normal)
    //        button.setTitleColor(.black, for: .normal)
    //        return button
    //    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getOffersCategorisSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        
    }
    
    
}
