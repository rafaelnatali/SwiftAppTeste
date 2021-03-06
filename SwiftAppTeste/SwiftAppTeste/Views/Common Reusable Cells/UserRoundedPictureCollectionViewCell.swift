//
//  UserRoundedPictureCollectionViewCell.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/1/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class UserRoundedPictureCollectionViewCell: UICollectionViewCell {

    //MARK: - Properties
    
    @IBOutlet weak private var roundedButton: UIButton?
    @IBOutlet weak private var nameText: UILabel?
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Methods
    
    func setup(model: UserRoundedPictureCollectionViewCellModel) {
        
        roundedButton?.setTitle(model.hasPicture ? String() : model.initialNameCapital, for: .normal)
        let image = model.hasPicture ? UIImage(named: model.pictureName!) : UIImage()
        
        roundedButton?.imageView?.contentMode = .scaleToFill
        roundedButton?.setImage(image, for: .normal)
        roundedButton?.backgroundColor = UIColor(model.backgroundColorHexString)
        
        nameText?.text = model.name
        guard let sizeLabel = nameText?.sizeThatFits(CGSize(width: self.bounds.width, height: 35))
            else { return }
        nameText?.frame.size.height = sizeLabel.height
    }

}
