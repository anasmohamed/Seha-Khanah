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
import AuthenticationServices

class LoginViewController: UIViewController ,LoginProtocol{
    
    @IBOutlet weak var socialStackView: UIStackView!
    
    @IBOutlet weak var createNewAccountBtn: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var signinWithGoogleBtn: UIButton!
    @IBOutlet weak var mainScrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var isAppointmentViewController = false
    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile,.email])
    var loginPresenter : LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let authorizationButton = ASAuthorizationAppleIDButton()


            
            authorizationButton.addTarget(self, action: #selector(handleLogInWithAppleIDButtonPress), for: .touchDown)
            socialStackView.addArrangedSubview(authorizationButton)

        } else {
            // Fallback on earlier versions
        }
        
        if isAppointmentViewController{
            self.navigationItem.setHidesBackButton(true, animated: true)
            self.tabBarController?.tabBar.isHidden = true
            
        }else{
            self.navigationItem.setHidesBackButton(false, animated: true)
            self.tabBarController?.tabBar.isHidden = false
            
        }
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
    
    @IBAction func signInWithAppleBtnDidTapped(_ sender: Any) {
        
        print("anas did tapped")
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
    @objc private func handleLogInWithAppleIDButtonPress() {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        } else {
            print("not accepte anas")
            // Fallback on earlier versions
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
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func loginSuccessNavigation(user:User)  {
        indicator.stopAnimating()
        let logoutSliderViewController = UIStoryboard.init(name: "Slider", bundle: nil).instantiateViewController(withIdentifier: "LogoutSliderViewController") as! LogoutSliderViewController
        logoutSliderViewController.modalPresentationStyle = .fullScreen
        logoutSliderViewController.isLoginController = true
        self.navigationController!.present(logoutSliderViewController, animated: true)
        
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
@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerDelegate {
    /// - Tag: did_complete_authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            // For the purpose of this demo app, store the `userIdentifier` in the keychain.
            self.loginPresenter.loginWithSocial(accessToken:email!
                                   , provider: "apple")
            self.saveUserInKeychain(userIdentifier)
            
            // For the purpose of this demo app, show the Apple ID credential information in the `ResultViewController`.
//            self.showResultViewController(userIdentifier: userIdentifier, fullName: fullName, email: email)
            
//        case let passwordCredential as ASPasswordCredential:
//            
//            // Sign in using an existing iCloud Keychain credential.
//            let username = passwordCredential.user
//            let password = passwordCredential.password
            
            // For the purpose of this demo app, show the password credential as an alert.
//            DispatchQueue.main.async {
//                self.showPasswordCredentialAlert(username: username, password: password)
//            }
            
        default:
            break
        }
    }
    
    private func saveUserInKeychain(_ userIdentifier: String) {
        do {
            //            try KeychainItem(service: "com.example.apple-samplecode.juice", account: "userIdentifier").saveItem(userIdentifier)
        } catch {
            print("Unable to save userIdentifier to keychain.")
        }
    }
    
    private func showResultViewController(userIdentifier: String, fullName: PersonNameComponents?, email: String?) {
        //        guard let viewController = self.presentingViewController as? ResultViewController
        //            else { return }
        //
        //        DispatchQueue.main.async {
        //            viewController.userIdentifierLabel.text = userIdentifier
        //            if let givenName = fullName?.givenName {
        //                viewController.givenNameLabel.text = givenName
        //            }
        //            if let familyName = fullName?.familyName {
        //                viewController.familyNameLabel.text = familyName
        //            }
        //            if let email = email {
        //                viewController.emailLabel.text = email
        //            }
        //            self.dismiss(animated: true, completion: nil)
        //        }
    }
    
    private func showPasswordCredentialAlert(username: String, password: String) {
        let message = "The app has received your selected credential from the keychain. \n\n Username: \(username)\n Password: \(password)"
        let alertController = UIAlertController(title: "Keychain Credential Received",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// - Tag: did_complete_error
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}

@available(iOS 13.0, *)
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    /// - Tag: provide_presentation_anchor
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

//extension UIViewController {
//
//    func showLoginViewController() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController {
//            loginViewController.modalPresentationStyle = .formSheet
//            loginViewController.isModalInPresentation = true
//            self.present(loginViewController, animated: true, completion: nil)
//        }
//    }
//}
