//
//  BookViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/3/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class BookViewController: UIViewController,BookingProtocol {
    
    
    var labDetails : LabDetails?
    @IBOutlet weak var labImageView: UIImageView!
    @IBOutlet weak var labNameAndSpeciltyVIew: UIView!
    @IBOutlet weak var presonDetailsView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var labNameLbl: UILabel!
    
    @IBOutlet weak var labServiceLbl: UILabel!
    @IBOutlet weak var lacationNameLbl: UILabel!
    
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    var date : String?
    var labName : String?
    var labPhoto :String?
    var labService: LabServices?
    var bookDate : String?
    var preseter : BookingPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        labImageView.layer.cornerRadius = labImageView.frame.width / 2
        cornerRadiusAndShodow(view: timeView)
        cornerRadiusAndShodow(view: labNameAndSpeciltyVIew)
        cornerRadiusAndShodow(view: presonDetailsView)
        
        
        labNameLbl.text = labName
        labServiceLbl.text = labService?.nameEn
        labImageView.kf.setImage(with: URL(string: labPhoto!))
        timeLbl.text = bookDate
        
        preseter = BookingPresenter(view: self)
        // Do any additional setup after loading the view.
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
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func bookingSuccess() {
        
    }
    
    func showError(error: String) {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func bookNowBtnDidTapped(_ sender: Any) {
        preseter?.bookLab(name: , email: <#T##String#>, phoneNumber: <#T##String#>, bookingDate: <#T##String#>, labId: <#T##String#>, checkbox: <#T##String#>)
    }
    
}
