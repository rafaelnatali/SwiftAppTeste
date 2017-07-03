//
//  MyMessagesViewController.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/2/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class MyMessagesViewController: BaseViewController, UICollectionViewDataSource {

    @IBOutlet private weak var collectionView: UICollectionView?
    
    lazy var datasource: [UserRoundedPictureCollectionViewCellModel] = UserRoundedPictureCollectionViewCellModel.generateMock(numberOfElements: 80)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reusableIdentifierForRecentMessagesCollectionView() -> String {
        return String(format: "%@%@", self.className, UserRoundedPictureCollectionViewCellModel.className)
    }
    
    func configureCollectionView() {
        collectionView?.dataSource = self
        
        let nibCell = UINib.init(nibName: UserRoundedPictureCollectionViewCell.className, bundle: Bundle(for: UserRoundedPictureCollectionViewCell.self))
        collectionView?.register(nibCell, forCellWithReuseIdentifier: reusableIdentifierForRecentMessagesCollectionView())
    }
    
    //MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifierForRecentMessagesCollectionView(), for: indexPath)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
