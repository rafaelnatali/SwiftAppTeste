//
//  MessageGridDatasourceAndDelegate.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import Foundation

import UIKit

protocol MessageGridDelegate: NSObjectProtocol {
    
    func cellDidLoad(collectionView: UICollectionView, indexPath: IndexPath, cell: UserRoundedPictureCollectionViewCell)
}

class MessageGridDatasourceAndDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - Properties
    
    private let identifierForCell: String
    private let datasource: [UserRoundedPictureCollectionViewCellModel]
    weak var delegate: MessageGridDelegate?
    
    //MARK: - Initializers
    
    init(identifierForCell: String, datasource: [UserRoundedPictureCollectionViewCellModel]) {
        self.identifierForCell = identifierForCell
        self.datasource = datasource
    }
    
    //MARK: - Methods
    
    func reusableIdentifier() -> String {
        return String(format: "%@%@", self.identifierForCell, UserRoundedPictureCollectionViewCell.className)
    }
    
    func registerCell(collectionView: UICollectionView) {
        let nibCell = UINib.init(nibName: UserRoundedPictureCollectionViewCell.className, bundle: Bundle(for: UserRoundedPictureCollectionViewCell.self))
        collectionView.register(nibCell, forCellWithReuseIdentifier: reusableIdentifier())
    }
    
    //MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier(), for: indexPath)
        
        let model = datasource[indexPath.row]
        
        guard cell is UserRoundedPictureCollectionViewCell
            else { return cell }
        
        let castCell: UserRoundedPictureCollectionViewCell = cell as! UserRoundedPictureCollectionViewCell
        castCell.setup(model: model)
        
        return castCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
}
