//
//  SuccessBookingDoctorViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/26/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class SuccessBookingDoctorViewController: UIViewController {
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    
    @IBOutlet weak var successView: UIView!
    
    var doctorName : String?
    var time: String?
    var date : String?
    var address : String?
    var price : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addressLbl.text = address
        timeLbl.text = time
        dateLbl.text = date
        priceLbl.text = price
        doctorNameLbl.text = doctorName
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        successView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
    }
    
    @IBAction func appointmentsBtnDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Search", bundle:nil )
        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBar")
        self.navigationController!.pushViewController(tabBar, animated: true)
        
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
