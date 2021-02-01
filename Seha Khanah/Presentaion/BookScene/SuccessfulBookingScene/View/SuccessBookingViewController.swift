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
    
    
    @IBOutlet weak var successView: UIView!
    var labName: String?
    var dayText: String?
    var labService: LabServices?
    var locationString : String?
    var labId: String?
    var labAddress: String?
    var profissionalTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLbl.text = dayText
        labServiceLbl.text = labService?.nameEn
        labNameLbl.text = labName
        locationLbl.text = labAddress
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        successView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 1, height: 1), radius: 5, scale: true)
        self.navigationItem.title = "Thanks".localized
        
    }
    
    
    @IBAction func successBtnDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Search", bundle:nil )
        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBar")
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
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
