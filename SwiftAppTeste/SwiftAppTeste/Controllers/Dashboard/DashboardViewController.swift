//
//  DashboardViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var dashboardHeaderView: DashboardHeaderView?
    
    var dashboardView: DashboardView {
        get {
            return view as! DashboardView
        }
    }
    
    lazy var recentMessagesCollectionViewDatasource: [UserRoundedPictureCollectionViewCellModel] = UserRoundedPictureCollectionViewCellModel.generateMock(numberOfElements: 20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureRecentMessagesTableView()
        configureRecentMessagesCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reusableIdentifierForRecentMessageTableView() -> String {
        return String(format: "%@%@", self.className, SaleDescriptionTableViewCell.className)
    }
    
    func configureRecentMessagesTableView() {
        dashboardView.recentMessagesTableView.delegate = self
        dashboardView.recentMessagesTableView.dataSource = self
        
        let content = XibView()
        content.frame = CGRect(origin: CGPoint.zero,
                               size: CGSize(width: view.bounds.size.width,
                                            height: 390))
        content.nibName = DashboardHeaderView.className
        content.xibSetup()
        let tableHeaderView = content.contentView
        dashboardView.recentMessagesTableView.tableHeaderView = tableHeaderView
        dashboardHeaderView = tableHeaderView as? DashboardHeaderView
        
        let nibCell = UINib.init(nibName: SaleDescriptionTableViewCell.className, bundle: Bundle(for: SaleDescriptionTableViewCell.self))
        dashboardView.recentMessagesTableView.register(nibCell, forCellReuseIdentifier: reusableIdentifierForRecentMessageTableView())
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
    
    //MARK: - UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifierForRecentMessageTableView(), for: indexPath)
        cell.selectionStyle = .none
        guard cell is SaleDescriptionTableViewCell
            else { return cell }
        
        let castCell: SaleDescriptionTableViewCell = cell as! SaleDescriptionTableViewCell
        castCell.changeBackgroundColor(indexPath: indexPath)
        
        return castCell
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
