//
//  LoginViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/14/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
class LoginViewController: UIViewController ,LoginProtocol{
    
    @IBOutlet weak var mainScrollViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile])
    var loginPresenter : LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        loginPresenter = LoginPresenter(view: self)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true
    }
    
    @IBAction func loginWithFacebookBtnDidTapped(_ sender: Any) {
        facebookLoginButton.sendActions(for: .touchUpInside)
        
    }
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        loginPresenter.login(email: email, password:password)
        
    }
    @objc func adjustForKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endFrameY = endFrame?.origin.y ?? 0
        let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        
        if endFrameY >= UIScreen.main.bounds.size.height {
            self.mainScrollViewBottomConstraint?.constant = 0.0
        } else {
            self.mainScrollViewBottomConstraint?.constant = endFrame?.size.height ?? 0.0
        }
        
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(0),
            options: animationCurve,
            animations: { self.view.layoutIfNeeded() },
            completion: nil)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func loginSuccess(user: User) {
        
    }
    
    func showError(error: String) {
        
    }
    
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        mainScrollViewBottomConstraint.constant = keyboardSize.height
    }
    
    func keyboardWillHide(_ notification: Notification) {
        mainScrollViewBottomConstraint.constant = 0
    }
    
    
    
    
}
extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        getUserDataFromFacebook()
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User logged out")
    }
    func getUserDataFromFacebook() {
        GraphRequest(graphPath: "me", parameters: ["fields": "first_name, picture, id"]).start { (connection, result, error) in
            if let err = error { print(err.localizedDescription); return } else {
                if let fields = result as? [String:Any], let firstName = fields["first_name"] as? String, let id = fields["id"] as? String {
                    let facebookProfileString = "http://graph.facebook.com/\(id)/picture?type=large"
                    print(firstName, id, facebookProfileString)
                }
            }
        }
    }
}
