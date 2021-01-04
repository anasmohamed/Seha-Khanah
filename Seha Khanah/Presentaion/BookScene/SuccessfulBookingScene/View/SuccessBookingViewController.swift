//
//  SuccessBookingViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class SuccessBookingViewController: UIViewController {

    @IBOutlet weak var successBtn: UIButton!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var labServiceLbl: UILabel!
    @IBOutlet weak var labNameLbl: UILabel!
    
    
    var labName: String?
    var dayText: String?
    var labService: LabServices?
    var locationString : String?
    var labId: String?
    var labAddress: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLbl.text = dayText
        labServiceLbl.text = labService?.nameEn
        labNameLbl.text = labName
        locationLbl.text = labAddress
        // Do any additional setup after loading the view.
    }
    

    @IBAction func successBtnDidTapped(_ sender: Any) {
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
