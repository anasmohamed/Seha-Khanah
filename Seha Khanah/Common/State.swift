//
//  State.swift
//  Seha Khanah
//
//  Created by Anas on 12/17/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
public enum State {
    
    case loading
    case error(error:String?)
    case empty
    case populated
    case reloading
        
}
