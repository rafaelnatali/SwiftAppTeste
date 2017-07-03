//
//  UserRoundedPictureCollectionViewCellModel.swift
//  SwiftAppTeste
//
//  Created by Rafael Natali Pinto Coelho on 7/1/17.
//  Copyright © 2017 Rafael Natali Pinto Coelho. All rights reserved.
//

import Foundation

class UserRoundedPictureCollectionViewCellModel: NSObject {
    
    //MARK: - Properties
    
    var pictureURL: String?
    var pictureName: String?
    var name: String?
    var backgroundColorHexString: String = Constants.ColorsHex.kColorFFFFFF
    
    //MARK: - Methods
    
    var hasPicture: Bool {
        return (pictureURL != nil) || (pictureName != nil)
    }
    
    var pictureIsLocal: Bool {
        return self.hasPicture && (self.pictureName != nil)
    }
    
    var initialNameCapital: String? {
        guard let initial = name?.capitalized.characters.first
            else { return nil }
        return String(initial)
    }
    
    //MARK: - Mock
    
    class func generateMock(numberOfElements: Int) -> [UserRoundedPictureCollectionViewCellModel] {
        var elements = [UserRoundedPictureCollectionViewCellModel]()
        var model: UserRoundedPictureCollectionViewCellModel
        let arrayNames: [String] = ["Pedro", "Matos", "Valéria", "Ciqueira", "Maria", "Carol", "Flávia", "Alcantara"]
        
        for _ in 1...numberOfElements {
            model = UserRoundedPictureCollectionViewCellModel()
            
            let index1 = Int(NSObject.randomNumber(upperRange: UInt32(arrayNames.count)))
            let index2 = Int(NSObject.randomNumber(upperRange: UInt32(arrayNames.count)))
            model.name = String(format: "%@ %@", arrayNames[index1], arrayNames[index2])
            
            if (NSObject.randomNumber(upperRange: 2) != 0) {
                model.pictureName = Constants.ImageNames.kIconMyMessages
            }
            
            var color: String
            let colorRandom = NSObject.randomNumber(upperRange: UInt32(3))
            switch colorRandom {
            case 0:
                color = Constants.ColorsHex.kColorA3C74B
            case 1:
                color = Constants.ColorsHex.kColorCE4251
            case 2:
                color = Constants.ColorsHex.kColor4982C5
            default:
                color = Constants.ColorsHex.kColorFFFFFF
            }
            model.backgroundColorHexString = model.hasPicture ? Constants.ColorsHex.kColorFFFFFF : color
            
            elements.append(model)
        }
        
        return elements
    }
}
