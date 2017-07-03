//
//  BaseToolbar.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class BaseToolbar: UIToolbar {

    //MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        frame.size.height = 68
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 68
        
        return size
    }
}
