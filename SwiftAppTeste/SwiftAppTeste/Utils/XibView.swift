//
//  XibView.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 6/30/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import UIKit

@IBDesignable
class XibView: UIView {
    
    //MARK: - Properties
    
    var contentView: UIView?
    @IBInspectable var nibName: String?
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        xibSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    //MARK: - Methods
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        guard nibName != nil else  { return nil }
        
        let nib = UINib(nibName: nibName!, bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
