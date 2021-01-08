//
//  PharmacyDetailsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class PharmacyDetailsPresenter {
    private let pharmacyDetailsInteractor:PharamcyDetailsInteractor
    private var pharmacy: PharmacyDetails
    private weak var view: PharmacyDetailsProtocol?
    init(view: PharmacyDetailsProtocol) {
        self.view = view
        self.pharmacyDetailsInteractor = PharamcyDetailsInteractor()
        pharmacy = PharmacyDetails()
        
    }
    
    func showPharmacyDetails(id:String) {
        
        view?.showIndicator()
        pharmacyDetailsInteractor.showPharmacyDetails(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.pharmacy = result!
                    self.view?.getPharmacyDetailsSuccess(pharmacy: self.pharmacy)
                }
                
            }
            
        }
    }
}
