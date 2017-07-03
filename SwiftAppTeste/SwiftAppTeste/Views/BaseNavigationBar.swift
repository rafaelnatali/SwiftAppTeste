//
//  BaseNavigationBar.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class BaseNavigationBar: UINavigationBar {
    
    //MARK: - Overrides
    
    override func didMoveToSuperview() {
        setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}
