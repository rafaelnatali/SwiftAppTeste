//
//  DashboardViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController, SaleDescriptionListDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - Properties 
    
    weak var dashboardHeaderView: DashboardHeaderView?
    private var tableViewList: SaleDescriptionListDatasourceAndDelegate?
    
    var dashboardView: DashboardView {
        get {
            return view as! DashboardView
        }
    }
    
    lazy var recentMessagesCollectionViewDatasource: [UserRoundedPictureCollectionViewCellModel] = UserRoundedPictureCollectionViewCellModel.generateMock(numberOfElements: 20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }
    
    //MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureRecentMessagesTableView()
        configureRecentMessagesCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    
    func configureRecentMessagesTableView() {
        tableViewList = SaleDescriptionListDatasourceAndDelegate(identifierForCell: self.className,
                                                                 datasource: Array.init(repeating: NSObject(), count: 10))
        tableViewList?.delegate = self
        tableViewList?.registerCell(tableView: dashboardView.recentMessagesTableView)
        
        dashboardView.recentMessagesTableView.delegate = tableViewList
        dashboardView.recentMessagesTableView.dataSource = tableViewList
        
        let content = XibView()
        content.frame = CGRect(origin: CGPoint.zero,
                               size: CGSize(width: view.bounds.size.width,
                                            height: 390))
        content.nibName = DashboardHeaderView.className
        content.xibSetup()
        let tableHeaderView = content.contentView
        dashboardView.recentMessagesTableView.tableHeaderView = tableHeaderView
        dashboardHeaderView = tableHeaderView as? DashboardHeaderView
    }
    
    func reusableIdentifierForRecentMessagesCollectionView() -> String {
        return String(format: "%@%@", self.className, UserRoundedPictureCollectionViewCellModel.className)
    }
    
    func configureRecentMessagesCollectionView() {
        dashboardHeaderView?.recentMessagesCollectionView.delegate = self
        dashboardHeaderView?.recentMessagesCollectionView.dataSource = self
        
        let nibCell = UINib.init(nibName: UserRoundedPictureCollectionViewCell.className, bundle: Bundle(for: UserRoundedPictureCollectionViewCell.self))
        dashboardHeaderView?.recentMessagesCollectionView.register(nibCell, forCellWithReuseIdentifier: reusableIdentifierForRecentMessagesCollectionView())
    }

    //MARK: - SaleDescriptionListDelegate
    
    func cellDidLoad(tableView: UITableView, indexPath: IndexPath, cell: SaleDescriptionTableViewCell) {
        
        cell.changeIconAlertVisibility(show: false)
    }
    
    //MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifierForRecentMessagesCollectionView(), for: indexPath)
        
        let model = recentMessagesCollectionViewDatasource[indexPath.row]
        
        guard cell is UserRoundedPictureCollectionViewCell
            else { return cell }
        
        let castCell: UserRoundedPictureCollectionViewCell = cell as! UserRoundedPictureCollectionViewCell
        castCell.setup(model: model)
        
        return castCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentMessagesCollectionViewDatasource.count
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
