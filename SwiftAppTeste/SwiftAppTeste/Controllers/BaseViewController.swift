//
//  BaseViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class BaseViewController: UIViewController {
    func replaceRootViewController(button: UIButton) {
        guard let viewController = NavigationHelper.controllerFor(menuOption: MenuOptions(rawValue: button.tag))
            else { return }
        
        self.navigationController?.viewControllers = [viewController]
    }
    
    func createToolbarItem(imageName: String, size: CGSize, menuOption: MenuOptions) -> UIBarButtonItem {
        let button: UIButton = UIButton(type: .custom)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(origin: CGPoint.zero, size: size)
        button.tag = menuOption.rawValue
        
        let barButtonItem: UIBarButtonItem = UIBarButtonItem.init(customView: button)
        
        button.addTarget(self, action: #selector(replaceRootViewController(button:)), for: .touchUpInside)
        
        return barButtonItem;
    }
    
    func insertToolbarItems() {
        guard let toolbar: UIToolbar = navigationController?.toolbar
            else { return; }
        let itemWidth: CGFloat = (toolbar.frame.size.width - 20) / 3;
        let itemSize: CGSize = CGSize(width: itemWidth, height: 40)
        toolbarItems = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                        createToolbarItem(imageName: Constants.ImageNames.kIconMyMessages,
                                          size: itemSize,
                                          menuOption: .MenuOptionMyMessages),
                        createToolbarItem(imageName: Constants.ImageNames.kIconMySales,
                                          size: itemSize,
                                          menuOption:  .MenuOptionMySales),
                        createToolbarItem(imageName: Constants.ImageNames.kIconMyNotifications,
                                          size: itemSize,
                                          menuOption: .MenuOptionDashboard),
                        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)]
        
        var positionsX = [CGFloat]()
        for view: UIView in toolbar.subviews {
            if (view is UIButton) {
                positionsX.append(view.frame.maxX + 5);
            }
        }
        for positionX in positionsX {
            if (positionX >= toolbar.frame.maxX) {
                break;
            }
            let view: UIView = UIView.init(frame: CGRect(origin: CGPoint(x: positionX,
                                                                         y: abs(toolbar.frame.size.height - itemSize.height) / 2),
                                                         size: CGSize(width: 0.5,
                                                                      height: itemSize.height)))
            view.backgroundColor = UIColor(Constants.ColorsHex.kColor919191)
            toolbar.addSubview(view)
        }
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.ImageNames.kIconImageName), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupNavigationBar()
        insertToolbarItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
