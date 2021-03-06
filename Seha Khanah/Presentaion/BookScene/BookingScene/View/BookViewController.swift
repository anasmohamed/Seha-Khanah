//
//  BookViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/3/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
import MOLH
import Toast_Swift
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
    var finalPhoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        labImageView.layer.cornerRadius = labImageView.frame.width / 2
        labImageView.layer.borderColor = UIColor.gray.cgColor
        labImageView.layer.borderWidth = 1
        dayLbl.text = dayName! + " " + date!
        labNameLbl.text = labName
        self.navigationItem.title = "Order".localized
        
        
        fullNameTextField.text = UserDefaults.standard.string(forKey: "name")
        emailTextField.text = UserDefaults.standard.string(forKey: "email")
        mobileNumberTextField.text = UserDefaults.standard.string(forKey:"phoneNumber")
        
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            labServiceLbl.text = labService?.nameEn
            
        }else{
            labServiceLbl.text = labService?.nameAr
            
        }
        setupToolbar()
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: timeView)
        timeView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        labNameAndSpeciltyVIew.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        presonDetailsView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        costView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
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
        if isDoctor
        {
            let successfulBookingDoctorViewController = storyboard.instantiateViewController(withIdentifier: "SuccessBookingDoctorViewController") as! SuccessBookingDoctorViewController
            successfulBookingDoctorViewController.doctorName = labName
            successfulBookingDoctorViewController.address = labAddress
            successfulBookingDoctorViewController.time =  bookDate
            successfulBookingDoctorViewController.date = dayName
            successfulBookingDoctorViewController.price = doctorCost
            self.navigationController!.pushViewController(successfulBookingDoctorViewController, animated: true)
        }else{
            let successfulBookingViewController = storyboard.instantiateViewController(withIdentifier: "SuccessBookingViewController") as! SuccessBookingViewController
            successfulBookingViewController.labName = labName
            successfulBookingViewController.labId = labId
            successfulBookingViewController.dayText = dayName
            successfulBookingViewController.labAddress = labAddress
            self.navigationController!.pushViewController(successfulBookingViewController, animated: true)
        }
        
        
        //        if isDoctor{
        //            successfulBookingViewController.labService = labService
        //        }else{
        //            successfulBookingViewController.profissionalTitle = profissionalTitle
        //
        //        }
        
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
        if !emailTextField.text!.isEmpty && !mobileNumberTextField.text!.isEmpty && !fullNameTextField.text!.isEmpty{
            if !mobileNumberTextField.text!.isEmpty{
                let phone = String(mobileNumberTextField.text!.suffix(10))
                print("phone \(phone)")
                finalPhoneNumber = "+964" + phone
            }
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
                preseter?.bookDoctor(name:fullNameTextField.text! , email: emailTextField.text!, phoneNumber:finalPhoneNumber , bookingDate:date! + " " + timeWithoutAMOrPM!,doctorId:labId! , checkbox: bookingForAnotherPatientCheck)
            }else{
                preseter?.bookLab(name:fullNameTextField.text! , email: emailTextField.text!, phoneNumber:finalPhoneNumber , bookingDate:date! + " " + timeWithoutAMOrPM!,labId:labId! , checkbox: "0")
            }
            
        }
            
        else {
            
            self.view.makeToast("Enter Missing Data".localized, duration: 3.0, position: .bottom)
            
            
        }
        
    }
    func setupToolbar(){
        //Create a toolbar
        let bar = UIToolbar()
        
        //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissMyKeyboard))
        
        //Create a felxible space item so that we can add it around in toolbar to position our done button
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Add the created button items in the toobar
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        
        //Add the toolbar to our textfield
        fullNameTextField.inputAccessoryView = bar
        mobileNumberTextField.inputAccessoryView = bar
        emailTextField.inputAccessoryView = bar
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
}
extension BookViewController: CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        bookingForAnotherPatientCheck = "1"
    }
    
    func chechboxButtonDidDeselect(_ button: CheckboxButton) {
        bookingForAnotherPatientCheck = "0"
        
    }
    
    
}
