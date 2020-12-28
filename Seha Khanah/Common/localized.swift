//
//  localized.swift
//  Seha Khanah
//
//  Created by Anas on 12/28/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
