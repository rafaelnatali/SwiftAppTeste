//
//  MySalesViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class MySalesViewController: BaseViewController, SaleDescriptionListDelegate {

    @IBOutlet private weak var tableView: UITableView?
    
    private var tableViewList: SaleDescriptionListDatasourceAndDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
    }

    func configureTableView() {
        tableViewList = SaleDescriptionListDatasourceAndDelegate(identifierForCell: self.className,
                                                                 datasource: Array.init(repeating: NSObject(), count: 50))
        tableViewList?.delegate = self
        tableViewList?.registerCell(tableView: tableView!)
        
        tableView?.delegate = tableViewList
        tableView?.dataSource = tableViewList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SaleDescriptionListDelegate
    func cellDidLoad(tableView: UITableView, indexPath: IndexPath, cell: SaleDescriptionTableViewCell) {
        
        cell.changeBorderRightVisibility(show: false)
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
