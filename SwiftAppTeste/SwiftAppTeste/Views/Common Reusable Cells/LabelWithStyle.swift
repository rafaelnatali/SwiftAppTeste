//
//  LabelWithStyle.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/4/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

@IBDesignable

class LabelWithStyle: UIView {
    
    @IBInspectable var text: String?
    @IBInspectable var fontPointSize: CGFloat = 17.0
    @IBInspectable var fontWeigth: CGFloat = UIFontWeightBold
    @IBInspectable var colorText: UIColor?
    @IBInspectable var paddingLabel: CGSize = CGSize.zero
    
    private weak var textLabel: UILabel?
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        initialize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyLayout()
    }
    
    //MARK: - Methods
    
    func initialize() {
        if (textLabel != nil) {
            return;
        }
        
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontPointSize, weight: fontWeigth)
        addSubview(label)
        textLabel = label
    }
    
    func applyLayout() {        
        textLabel?.textColor = colorText
        textLabel?.text = text
        textLabel?.sizeToFit()
        guard let textSize = textLabel?.frame.size else { return }
        let newSize = CGSize(width: textSize.width + paddingLabel.width,
                             height: textSize.height + paddingLabel.height)
        textLabel?.frame = CGRect(origin: CGPoint.zero, size: newSize)
        
        frame = CGRect(origin: frame.origin, size: newSize)
    }
}
