//
//  SaleDescriptionTableViewCell.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/1/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

class SaleDescriptionTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func changeBackgroundColor(indexPath: IndexPath) {
        var colorHexvalue = Constants.ColorsHex.kColorFFFFFF
        if (indexPath.row % 2 == 0) {
            colorHexvalue = Constants.ColorsHex.kColorF4F4F4
        }
        self.backgroundColor = UIColor(colorHexvalue)
    }
    
}
