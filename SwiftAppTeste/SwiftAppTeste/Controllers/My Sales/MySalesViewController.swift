//
//  MySalesViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class MySalesViewController: BaseViewController, SaleDescriptionListDelegate {

    //MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView?
    
    private var saleList: SaleDescriptionListDatasourceAndDelegate?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
    }

    //MARK: - Methods
    
    func configureTableView() {
        saleList = SaleDescriptionListDatasourceAndDelegate(identifierForCell: self.className,
                                                                 datasource: Array.init(repeating: NSObject(), count: 50))
        saleList?.delegate = self
        saleList?.registerCell(tableView: tableView!)
        
        tableView?.delegate = saleList
        tableView?.dataSource = saleList
    }
    
    // MARK: - SaleDescriptionListDelegate
    func cellDidLoad(tableView: UITableView, indexPath: IndexPath, cell: SaleDescriptionTableViewCell) {
        cell.changeBorderRightVisibility(show: false)
        cell.changeIconAlertVisibility(show: indexPath.row < 2)
    }
}
