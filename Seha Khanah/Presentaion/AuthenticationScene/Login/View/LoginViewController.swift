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
import GoogleSignIn
import SwiftyJSON
import Toast_Swift

class LoginViewController: UIViewController ,LoginProtocol{
    
    
    @IBOutlet weak var createNewAccountBtn: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var signinWithGoogleBtn: UIButton!
    @IBOutlet weak var mainScrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile,.email])
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
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        createNewAccountBtn.layer.cornerRadius = 5
        createNewAccountBtn.layer.borderColor = UIColor.black.cgColor
        createNewAccountBtn.layer.borderWidth = 1
        // Automatically sign in the user.
        if isKeyPresentInUserDefaults(key: "isUserLoggedin"){
            let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
            let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBar")
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.present(tabBarViewController, animated: true, completion: nil)
        }
        var token = UserDefaults.standard.string(forKey: "token")
        print(token)
        loginPresenter.getUserToken(grantType:"client_credentials" , clientId: "7", clientSecret: "OYFfHRim0QjFYHSuBdWc49arCyII99agIFdpKV7e", scope: "*")
        
        setupToolbar()
        
    }
    
    @IBAction func signInWithGoogleBtnDidTapped(_ sender: Any) {
        loginPresenter.getUserToken(grantType:"client_credentials" , clientId: "7", clientSecret: "OYFfHRim0QjFYHSuBdWc49arCyII99agIFdpKV7e", scope: "*")
        GIDSignIn.sharedInstance()?.signIn()
        
        
    }
    
    @IBAction func forgetPasswordBtnDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "ForgetPassword", bundle: nil)
               
               let registerViewController = storyboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController") as! ForgetPasswordViewController
               self.navigationController!.pushViewController(registerViewController, animated: true)
    }
    @IBAction func loginWithFacebookBtnDidTapped(_ sender: Any) {
        facebookLoginButton.sendActions(for: .touchUpInside)
        
    }
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let password = passwordTextField.text else {
            
            return
        }
        if !email.isEmpty && !password.isEmpty{
            loginPresenter.login(email: email, password:password)}
        else{
            self.view.makeToast("Please Enter Email and Password".localized, duration: 5.0, position: .bottom)

        }
        
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
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
        
    }
    func getAccessTokenSuccess(accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
    }
    
    
    func loginSuccess(user: User) {
       loginSuccessNavigation(user:user)
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        print(error)
        if !error.isEmpty{
        self.view.makeToast(error.localized, duration: 5.0, position: .bottom)
        }
    }
    func setupToolbar(){
           //Create a toolbar
           let bar = UIToolbar()
           
           //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissKeyboard))
           
           //Create a felxible space item so that we can add it around in toolbar to position our done button
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           
           //Add the created button items in the toobar
           bar.items = [flexSpace, flexSpace, doneBtn]
           bar.sizeToFit()
           
           //Add the toolbar to our textfield
           passwordTextField.inputAccessoryView = bar
           emailTextField.inputAccessoryView = bar
       }
       
       
    func loginSuccessNavigation(user:User)  {
        indicator.stopAnimating()
               let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
               let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBar")
               tabBarViewController.modalPresentationStyle = .fullScreen
               self.present(tabBarViewController, animated: true, completion: nil)
               UserDefaults.standard.set(true, forKey: "isUserLoggedin")
               UserDefaults.standard.set(user.email, forKey: "email")
               UserDefaults.standard.set(user.birthday, forKey: "birthday")
               UserDefaults.standard.set(user.genderId, forKey: "genderId")
               UserDefaults.standard.set(user.id, forKey: "id")
               UserDefaults.standard.set(user.name, forKey: "name")
               UserDefaults.standard.set(user.phoneNumber, forKey: "phoneNumber")
               UserDefaults.standard.set(user.token, forKey: "token")
    }
    
    @IBAction func createNewAccountBtnDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Signup", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController!.pushViewController(registerViewController, animated: true)
    }
    
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        mainScrollViewBottomConstraint.constant = keyboardSize.height
    }
    
    func keyboardWillHide(_ notification: Notification) {
        mainScrollViewBottomConstraint.constant = 0
    }
    
    func showErrorWithSocial(error: String) {
        print(error)
        let storyboard = UIStoryboard.init(name: "Signup", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController!.pushViewController(registerViewController, animated: true)
    }
    
    func loginSuccessWithFacebook(user: User) {
        loginSuccessNavigation(user:user)
        UserDefaults.standard.set(true, forKey: "loginWithFacebook")
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
     
        let requestedFields = "email, first_name, last_name"
        GraphRequest.init(graphPath: "me", parameters: ["fields":requestedFields]).start { (connection, result, error) -> Void in
            if let err = error { print(err.localizedDescription); return } else {
                if let fields = result as? [String:Any], let firstName = fields["first_name"] as? String, let id = fields["id"] as? String, let email = fields["email"] as? String{
                    print("token\(AccessToken.current!.tokenString)")
                    let facebookProfileString = "http://graph.facebook.com/\(id)/picture?type=large"
                    self.loginPresenter.loginWithSocial(accessToken:email
                        , provider: "facebook")
                    print("email \(email)")
                    print(firstName, id, facebookProfileString)
                    print("facebook id\(id)")
                    
                }
            }
        }
    }
    
}

extension LoginViewController :GIDSignInDelegate {
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        self.loginPresenter.loginWithSocial(accessToken:user.profile.email
            , provider: "google")
        
        
        
    }
    
    
}
