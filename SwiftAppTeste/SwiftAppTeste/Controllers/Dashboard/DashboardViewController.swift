//
//  DashboardViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController, SaleDescriptionListDelegate {
    
    //MARK: - Properties 
    
    private weak var dashboardHeaderView: DashboardHeaderView?
    private var saleList: SaleDescriptionListDatasourceAndDelegate?
    private var messageGrid: MessageGridDatasourceAndDelegate?
    
    var dashboardView: DashboardView {
        get {
            return view as! DashboardView
        }
    }
    
    lazy var recentMessagesCollectionViewDatasource: [UserRoundedPictureCollectionViewCellModel] = UserRoundedPictureCollectionViewCellModel.generateMock(numberOfElements: 20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureRecentMessagesTableView()
        configureRecentMessagesCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Methods
    
    func configureRecentMessagesTableView() {
        guard let tableView = self.dashboardView.recentMessagesTableView else {
            return
        }
        
        saleList = SaleDescriptionListDatasourceAndDelegate(identifierForCell: self.className,
                                                                 datasource: Array.init(repeating: NSObject(), count: 10))
        saleList?.delegate = self
        saleList?.registerCell(tableView: tableView)
        
        tableView.delegate = saleList
        tableView.dataSource = saleList
        
        let content = XibView()
        content.frame = CGRect(origin: CGPoint.zero,
                               size: CGSize(width: view.bounds.size.width,
                                            height: 390))
        content.nibName = DashboardHeaderView.className
        content.xibSetup()
        let tableHeaderView = content.contentView
        tableView.tableHeaderView = tableHeaderView
        dashboardHeaderView = tableHeaderView as? DashboardHeaderView
    }
    
    func reusableIdentifierForRecentMessagesCollectionView() -> String {
        return String(format: "%@%@", self.className, UserRoundedPictureCollectionViewCellModel.className)
    }
    
    func configureRecentMessagesCollectionView() {
        guard let collectionView = dashboardHeaderView?.recentMessagesCollectionView else {
            return
        }
        
        messageGrid = MessageGridDatasourceAndDelegate(identifierForCell: self.className,
                                                        datasource: recentMessagesCollectionViewDatasource)
        messageGrid?.registerCell(collectionView: collectionView)
        
        collectionView.delegate = messageGrid
        collectionView.dataSource = messageGrid
    }

    //MARK: - SaleDescriptionListDelegate
    
    func cellDidLoad(tableView: UITableView, indexPath: IndexPath, cell: SaleDescriptionTableViewCell) {
        
        cell.changeIconAlertVisibility(show: false)
    }
}
