//
//  AboutAppPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import MOLH

class AboutAppPresenter {
    private let aboutAppInteractor:AboutAppInteractor
     private var aboutApp: [AboutApp]
     private weak var view: AboutAppProtocol?

     init(view: AboutAppProtocol) {
         self.view = view
         self.aboutAppInteractor = AboutAppInteractor()
         aboutApp = [AboutApp]()
     }
     
     func getAboutApp() {
         
         view?.showIndicator()
         aboutAppInteractor.getAboutApp{ (result,error)  in
             if let error = error {
                 print("errrror\(error)")
                 self.view?.showError(error: error.localizedDescription)
             } else {
                 if result != nil{
                     self.aboutApp = result!
                    self.view?.aboutAppResults()
                 }
                 
             }
             
         }
     }
    
     
   
         
     public func getAboutAppText() -> String
     {
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            return aboutApp[0].aboutAppEn!

        }else
        {
            return aboutApp[0].aboutAppAr!

        }
    }
     
}
