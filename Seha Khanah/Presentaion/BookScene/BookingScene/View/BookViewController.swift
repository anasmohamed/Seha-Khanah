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
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    var date : String?
    var labName : String?
    var labPhoto :String?
    var labService: LabServices?
    var bookDate : String?
    var labId: String?
    var dayName : String?
    var preseter : BookingPresenter?
    var labAddress : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labImageView.layer.cornerRadius = labImageView.frame.width / 2
        cornerRadiusAndShodow(view: timeView)
        cornerRadiusAndShodow(view: labNameAndSpeciltyVIew)
        cornerRadiusAndShodow(view: presonDetailsView)
        
        dayLbl.text = dayName
        labNameLbl.text = labName
        labServiceLbl.text = labService?.nameEn
        labImageView.kf.setImage(with: URL(string: labPhoto!))
        timeLbl.text = bookDate
        lacationNameLbl.text = labAddress
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
        
        let storyboard = UIStoryboard.init(name: "SuccessfulBooking", bundle:nil )
        let successfulBookingViewController = storyboard.instantiateViewController(withIdentifier: "SuccessBookingViewController") as! SuccessBookingViewController
        successfulBookingViewController.labName = labName
        successfulBookingViewController.labService = labService
        successfulBookingViewController.labId = labId
        successfulBookingViewController.dayText = dayName
        successfulBookingViewController.labAddress = labAddress
        self.navigationController!.pushViewController(successfulBookingViewController, animated: true)
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
        print (date! + timeLbl.text!)
        var timeWithoutAMOrPM : String?
        if  (timeLbl.text?.contains("am"))!
        {
            timeWithoutAMOrPM = timeLbl.text!.replacingOccurrences(of: "am", with: "", options: NSString.CompareOptions.literal, range:nil)
            
        }else
        {
            timeWithoutAMOrPM = timeLbl.text!.replacingOccurrences(of: "am", with: "", options: NSString.CompareOptions.literal, range:nil)
        }
        print (date! + " " + timeWithoutAMOrPM!)
        
        preseter?.bookLab(name:fullNameTextField.text! , email: emailTextField.text!, phoneNumber:mobileNumberTextField.text! , bookingDate:date! + " " + timeWithoutAMOrPM!,labId:labId! , checkbox: "0")
    }
    
}
