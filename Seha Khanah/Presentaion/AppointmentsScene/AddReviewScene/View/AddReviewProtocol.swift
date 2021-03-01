//
//  AddReviewProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 3/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol AddReviewProtocol:class {
    func showIndicator()
    func hideIndicator()
    func success(message:String)
    func showError(error: String)
}
