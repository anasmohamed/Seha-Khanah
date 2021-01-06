//
//  DoctorDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
class DoctorDetailsViewController: UIViewController,DoctorDetailsProtocol {
  
    @IBOutlet weak var doctorView: UIView!
    
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var numberOfRaitings: UILabel!
    
    @IBOutlet weak var totalRating: CosmosView!
    @IBOutlet weak var watingTimeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var profissionalTitleLbl: UILabel!
    @IBOutlet weak var numberOfSeenLbl: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    var doctorId : String?
    var presenter : DoctorDetailsPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DoctorDetailsPresenter(view:self)
        presenter.showDoctorDetails(id: doctorId!)

        // Do any additional setup after loading the view.
    }
    
    func showIndicator() {
          
      }
      
      func hideIndicator() {
          
      }
      
      func showDoctorDetails(doctorDetails: DoctorDetails) {
        watingTimeLbl.text = doctorDetails.waitingTime
        costLbl.text = doctorDetails.price
        totalRating.rating = Double(doctorDetails.rating!)!
        numberOfSeenLbl.text = doctorDetails.vistorNumber! + " Seen"
        doctorImageView.kf.setImage(with: URL(string: doctorDetails.photo!))
        numberOfRaitings.text = "Overall Rating From " + doctorDetails.vistorNumber! + "Visitor"
        doctorNameLbl.text = doctorDetails.doctorFirstNameEn! +  doctorDetails.doctorLastNameEn!
        profissionalTitleLbl.text = doctorDetails.profissionalTitleEn
        cornerRadiusAndShodow(view: doctorView)
      }
      func cornerRadiusAndShodow(view:UIView)  {
             view.layer.shadowColor = UIColor.gray.cgColor
             view.layer.shadowOpacity = 1
             view.layer.shadowOffset = .zero
             view.layer.shadowRadius = 3
             view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
             view.layer.shouldRasterize = true
             view.layer.rasterizationScale = UIScreen.main.scale
             view.layer.cornerRadius = 5
         }
      func showError(error: String) {
          
      }
      
      func showNoDataFoundImage() {
          
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
