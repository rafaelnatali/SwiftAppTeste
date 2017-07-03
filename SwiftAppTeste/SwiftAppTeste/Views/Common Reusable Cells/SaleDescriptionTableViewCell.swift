//
//  SaleDescriptionTableViewCell.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/1/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class SaleDescriptionTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet weak private var iconAlert: UIImageView?
    @IBOutlet weak private var borderRight: UIView?
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Overrides
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    
    func changeBackgroundColor(indexPath: IndexPath) {
        var colorHexvalue = Constants.ColorsHex.kColorFFFFFF
        if (indexPath.row % 2 == 0) {
            colorHexvalue = Constants.ColorsHex.kColorF4F4F4
        }
        self.backgroundColor = UIColor(colorHexvalue)
    }
    
    func changeBorderRightVisibility(show: Bool) {
        borderRight?.isHidden = !show
    }
    
    func changeIconAlertVisibility(show: Bool) {
        iconAlert?.isHidden = !show
    }
    
}
