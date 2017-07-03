//
//  NavigationHelper.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import Foundation
import UIKit


class NavigationHelper: NSObject {
    
    //MARK: - Static Methods
    
    class func controllerFor(menuOption: MenuOptions?) -> UIViewController? {
        guard menuOption != nil else {
            return nil
        }
        
        let option = menuOption!
        var viewController: UIViewController?
        switch option {
        case .MenuOptionDashboard:
            viewController = UIStoryboard(name: Constants.StoryboardNames.kMainSB, bundle: nil).instantiateViewController(withIdentifier: Constants.ControllerIdentifiers.kDashboardVC)
        case .MenuOptionMySales:
            viewController = UIStoryboard(name: Constants.StoryboardNames.kMainSB, bundle: nil).instantiateViewController(withIdentifier: Constants.ControllerIdentifiers.kMySalesVC)
        case .MenuOptionMyMessages:
            viewController = UIStoryboard(name: Constants.StoryboardNames.kMainSB, bundle: nil).instantiateViewController(withIdentifier: Constants.ControllerIdentifiers.kMyMessagesVC)
        }
        return viewController
    }
    
    class func navigationBarTintColorFor(menuOption: MenuOptions?) -> UIColor {
        var color: UIColor = UIColor(Constants.ColorsHex.kColorD04F2A)
        guard menuOption != nil else {
            return color
        }
        
        let option = menuOption!
        switch option {
        case .MenuOptionMySales:
            color = UIColor(Constants.ColorsHex.kColor4982C5)
        case .MenuOptionMyMessages:
            color = UIColor(Constants.ColorsHex.kColorE7AD45)
        default:
            color = UIColor(Constants.ColorsHex.kColorD04F2A)
        }
        return color
    }
    
}
