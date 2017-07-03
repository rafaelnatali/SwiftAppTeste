//
//  MyMessagesViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class MyMessagesViewController: BaseViewController, MessageGridDelegate {

    //MARK: - Properties
    
    @IBOutlet private weak var collectionView: UICollectionView?
    
    private var messageGrid: MessageGridDatasourceAndDelegate?
    
    lazy var datasource: [UserRoundedPictureCollectionViewCellModel] = UserRoundedPictureCollectionViewCellModel.generateMock(numberOfElements: 80)
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureCollectionView()
    }

    //MARK: - Methods
    
    func configureCollectionView() {
        guard let collectionView = self.collectionView else {
            return
        }
        
        messageGrid = MessageGridDatasourceAndDelegate(identifierForCell: self.className, datasource: self.datasource)
        messageGrid?.registerCell(collectionView: collectionView)
        
        collectionView.delegate = messageGrid
        collectionView.dataSource = messageGrid
    }
    
    //MARK: - MessageGridDelegate
    
    func cellDidLoad(collectionView: UICollectionView, indexPath: IndexPath, cell: UserRoundedPictureCollectionViewCell) {
        
        
        NSObject()
    }
}
