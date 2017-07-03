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
}
