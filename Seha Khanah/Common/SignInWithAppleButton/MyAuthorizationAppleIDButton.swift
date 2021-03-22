//
//  MyAuthorizationAppleIDButton.swift
//  Seha Khanah
//
//  Created by Anas on 3/17/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import AuthenticationServices

@IBDesignable
@available(iOS 13.0, *)
class MyAuthorizationAppleIDButton: UIButton {
    private var authorizationButton: ASAuthorizationAppleIDButton!
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Create ASAuthorizationAppleIDButton
        authorizationButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
//        authorizationButton.addTarget(self, action: #selector(authorizationAppleIDButtonTapped(_:)), for: .touchUpInside)
        
        // Show authorizationButton
        addSubview(authorizationButton)
        
        // Use auto layout to make authorizationButton follow the MyAuthorizationAppleIDButton's dimension
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorizationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            authorizationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            authorizationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            authorizationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0),
        ])
    }
//    @objc func authorizationAppleIDButtonTapped(_ sender: Any) {
//        // Forward the touch up inside event to MyAuthorizationAppleIDButton
//        sendActions(for: .touchUpInside)
//    }
    
}
