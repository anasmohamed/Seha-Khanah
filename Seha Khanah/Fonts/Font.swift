//
//  Font.swift
//  RagehResturant
//
//  Created by Ahmed on 1/14/20.
//  Copyright © 2020 AhmedDev. All rights reserved.
//

import UIKit

enum SukarFont: String {
    
    case Black = "Black"
    case Bold = "Bold"
    case Regular = "Regular"
   
    
    func with(size: CGFloat) -> UIFont {
        return UIFont(name: "Sukar-\(rawValue)", size: size)!
    }
}
