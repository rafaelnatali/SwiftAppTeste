//
//  SaleDescriptionListDatasourceAndDelegate.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

protocol SaleDescriptionListDelegate: NSObjectProtocol {
    
    func cellDidLoad(tableView: UITableView, indexPath: IndexPath, cell: SaleDescriptionTableViewCell)
}

class SaleDescriptionListDatasourceAndDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    
    private let identifierForCell: String
    private let datasource: [NSObject]
    weak var delegate: SaleDescriptionListDelegate?
    
    //MARK: - Initializers    
    
    init(identifierForCell: String, datasource: [NSObject]) {
        self.identifierForCell = identifierForCell
        self.datasource = datasource
    }
    
    //MARK: - Methods
    
    func reusableIdentifier() -> String {
        return String(format: "%@%@", self.identifierForCell, SaleDescriptionTableViewCell.className)
    }
    
    func registerCell(tableView: UITableView) {
        let nibCell = UINib.init(nibName: SaleDescriptionTableViewCell.className, bundle: Bundle(for: SaleDescriptionTableViewCell.self))
        tableView.register(nibCell, forCellReuseIdentifier: reusableIdentifier())
        
    }
    
    //MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier(), for: indexPath)
        cell.selectionStyle = .none
        guard cell is SaleDescriptionTableViewCell
            else { return cell }
        
        let castCell: SaleDescriptionTableViewCell = cell as! SaleDescriptionTableViewCell
        castCell.changeBackgroundColor(indexPath: indexPath)
        
        delegate?.cellDidLoad(tableView: tableView, indexPath: indexPath, cell: castCell)
        
        return castCell
    }
}
