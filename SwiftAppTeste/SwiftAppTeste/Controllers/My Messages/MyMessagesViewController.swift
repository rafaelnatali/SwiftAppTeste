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
        createNavBarRightItem()
        configureCollectionView()
    }

    //MARK: - Methods
    
    func createNavBarRightItem() {
        let item: LabelWithStyle = LabelWithStyle()
        item.backgroundColor = UIColor.white
        item.colorText = UIColor(Constants.ColorsHex.kColor5F498C)
        item.text = "+10"
        item.paddingLabel = CGSize(width: 10, height: 7)
        item.clipsToBounds = true
        item.layer.masksToBounds = true
        item.layer.cornerRadius = 2
        
        item.initialize()
        item.setNeedsLayout()
        item.layoutIfNeeded()
        let barButtonItem: UIBarButtonItem = UIBarButtonItem(customView: item)
        
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
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
        //TODO: Implementar lógica para exibir o ícone de alerta - será necessário alterar a collection view cell para adicionar o ícone
    }
}
