//
//  AddReviewViewController.swift
//  Seha Khanah
//
//  Created by Anas on 3/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
class AddReviewViewController: UIViewController ,AddReviewProtocol{
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sumitBtn: UIButton!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addReviewView: UIView!
    
    var presenter : AddReviewPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTextView.text = "Add Review".localized
        reviewTextView.textColor = UIColor.lightGray
        presenter = AddReviewPresenter(view: self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnDidTapped(_ sender: Any) {
        
        
    }
    @IBAction func submitBtnDidTapped(_ sender: Any) {
        
        presenter.AddReview(comment: ratingView.text, rating: ratingView.rating, bookId: , checkbox: true)
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reviewTextView.textColor == UIColor.lightGray {
            reviewTextView.text = nil
            reviewTextView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if reviewTextView.text.isEmpty {
            reviewTextView.text = "Add Review".localized
            reviewTextView.textColor = UIColor.lightGray
        }
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func success(message: String) {
        
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
    
}
