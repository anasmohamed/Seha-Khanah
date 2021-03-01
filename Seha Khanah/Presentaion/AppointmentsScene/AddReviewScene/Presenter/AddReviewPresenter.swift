//
//  AddReviewPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 3/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class AddReviewPresenter {
    private let addReviewInteractor:AddReviewInteractor
    private weak var view: AddReviewProtocol?
    
    init(view: AddReviewProtocol) {
        self.view = view
        self.addReviewInteractor = AddReviewInteractor()
    }
    
    func  AddReview(comment:String,rating:Int,bookId:Int,checkbox:Int) {
        
        view?.showIndicator()
        addReviewInteractor.AddReview(comment: comment, rating: rating, bookId: bookId, checkbox: checkbox){ (result,error)  in
            if let error = error {
                print("errrror  \(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    
                    print("get my bookings result \(result)")
                    self.view?.success(message: result!)
                    
                }
                
            }
            
        }
    }
}
