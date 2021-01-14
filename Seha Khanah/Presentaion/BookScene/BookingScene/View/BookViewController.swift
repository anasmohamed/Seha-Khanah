//
//  BookViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/3/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
class BookViewController: UIViewController,BookingProtocol {
    
    @IBOutlet weak var costView: UIView!
    
    @IBOutlet weak var costLbl: UILabel!
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
    
    @IBOutlet weak var bookingForAnotherPatientBtn: CheckboxButton!
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
    var isDoctor = false
    var doctorCost : String?
    var profissionalTitle: String?
    var doctorId : String?
    var bookingForAnotherPatientCheck = "0"
    let locale = NSLocale.current.languageCode

    override func viewDidLoad() {
        super.viewDidLoad()
        labImageView.layer.cornerRadius = labImageView.frame.width / 2
        cornerRadiusAndShodow(view: timeView)
        cornerRadiusAndShodow(view: labNameAndSpeciltyVIew)
        cornerRadiusAndShodow(view: presonDetailsView)
        cornerRadiusAndShodow(view: costView)
        dayLbl.text = dayName
        labNameLbl.text = labName
        if locale == "en"
        {
            labServiceLbl.text = labService?.nameEn

        }else{
            labServiceLbl.text = labService?.nameAr

        }
        labImageView.kf.setImage(with: URL(string: labPhoto!))
        timeLbl.text = bookDate
        lacationNameLbl.text = labAddress
        preseter = BookingPresenter(view: self)
        if isDoctor{
            costView.isHidden = false
            costLbl.text = doctorCost
            labServiceLbl.text = profissionalTitle
            bookingForAnotherPatientBtn.isEnabled = true
        }
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
        if isDoctor{
        successfulBookingViewController.labService = labService
        }else{
            successfulBookingViewController.profissionalTitle = profissionalTitle

        }
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
        if isDoctor{
            preseter?.bookDoctor(name:fullNameTextField.text! , email: emailTextField.text!, phoneNumber:mobileNumberTextField.text! , bookingDate:date! + " " + timeWithoutAMOrPM!,doctorId:labId! , checkbox: bookingForAnotherPatientCheck)
        }else{
        preseter?.bookLab(name:fullNameTextField.text! , email: emailTextField.text!, phoneNumber:mobileNumberTextField.text! , bookingDate:date! + " " + timeWithoutAMOrPM!,labId:labId! , checkbox: "0")
        }}
    
}
extension BookViewController: CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        bookingForAnotherPatientCheck = "1"
    }
    
    func chechboxButtonDidDeselect(_ button: CheckboxButton) {
        bookingForAnotherPatientCheck = "0"

    }
    
    
}
