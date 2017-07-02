//
//  NSObject+Helper.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/1/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
    class func randomNumber(upperRange: UInt32) -> UInt32 {
        return UInt32(arc4random_uniform(upperRange));
    }
}
