//
//  LabDayDatesCollectionViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/3/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TimeCollectionViewCell"

class LabDayDatesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    var times : [Time]?
    var labDate : LabDate?
    var isDoctor: Bool?
    var doctorCost: String?
    var labDetails : LabDetails?
    var labName : String?
    var labPhoto :String?
    var labService: LabServices?
    var labId: String?
    var labAddress: String?
    var profissionalTitle: String?
    let locale = NSLocale.current.languageCode
    
    @IBOutlet weak var dayDateLbl: UILabel!
    @IBOutlet weak var dayDatesCollectionView: UICollectionView!
    @IBOutlet weak var dayDateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayDatesCollectionView.delegate = self
        dayDatesCollectionView.dataSource = self
        if locale == "en"
        {
            dayDateLbl.text = (labDate?.dayEn)! + " " + (labDate?.date)!
            
        }else{
            dayDateLbl.text = (labDate?.dayAr)! + " " + (labDate?.date)!
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: dayDateView)
        
    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 10
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return times!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
        cell.timeLbl.text = times![indexPath.row].time
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "BookNow", bundle:nil )
        let bookViewController = storyboard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        bookViewController.labDetails = labDetails
        bookViewController.labName = labName
        bookViewController.labPhoto = labPhoto
        bookViewController.labService = labService
        bookViewController.bookDate = times![indexPath.row].time
        bookViewController.date = labDate?.date
        bookViewController.labId = labId
        if locale == "en"
        {        bookViewController.dayName = labDate?.dayEn
            
            
        }else{
            bookViewController.dayName = labDate?.dayAr
            
        }
        bookViewController.labAddress = labAddress
        bookViewController.isDoctor = isDoctor!
        bookViewController.doctorCost = doctorCost
        bookViewController.profissionalTitle = profissionalTitle
        self.navigationController!.pushViewController(bookViewController, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
