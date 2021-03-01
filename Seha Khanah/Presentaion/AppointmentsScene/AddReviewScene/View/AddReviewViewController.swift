//
//  AddReviewViewController.swift
//  Seha Khanah
//
//  Created by Anas on 3/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos

import Toast_Swift
class AddReviewViewController: UIViewController ,AddReviewProtocol,UITextViewDelegate{
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sumitBtn: UIButton!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addReviewView: UIView!
    var onDoneBlock : ((String) -> Void)?

    var bookId = 0
    var presenter : AddReviewPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTextView.text = "Add Review".localized
        reviewTextView.textColor = UIColor.lightGray
        reviewTextView.delegate = self
        presenter = AddReviewPresenter(view: self)
        addReviewView.layer.cornerRadius = 10
        sumitBtn.layer.cornerRadius = 10
        cancelBtn.layer.borderWidth = 1
        cancelBtn.layer.borderColor = UIColor.init(red: 25.0/255.0, green: 76.0/255.0, blue: 121.0/255.0, alpha: 1).cgColor
        cancelBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnDidTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func submitBtnDidTapped(_ sender: Any) {
        if !reviewTextView.text.isEmpty{
            presenter.AddReview(comment: reviewTextView.text!, rating: Int(ratingView.rating), bookId:bookId, checkbox: 0)}
        else{
            self.view.makeToast("Please Enter Your Comment".localized, duration: 3.0, position: .bottom)
        }
        
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
        print(message)
        self.onDoneBlock!(message)
        self.dismiss(animated: true, completion: nil)
    }
    
    func showError(error: String) {
        self.view.makeToast(error.localized, duration: 3.0, position: .bottom)
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
