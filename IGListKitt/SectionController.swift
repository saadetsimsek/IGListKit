//
//  SectionController.swift
//  IGListKitt
//
//  Created by Saadet Şimşek on 19/08/2024.
//

import Foundation
import IGListKit

final class LabelSectionController: ListSectionController {
    
    private var text: String?
    
    override init() {
        super.init()
        
        inset = UIEdgeInsets(top: 5,
                             left: 5,
                             bottom: 5,
                             right: 5)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CollectionViewCell.self, for: self, at: index) as! CollectionViewCell
        cell.configure(with: text)
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width-10,
                      height: 200)
    }
    
    override func didUpdate(to object: Any) {
        self.text = object as? String
    }
    
    override func didSelectItem(at index: Int) {
        print("Selected : \(String(describing: text))")
    }
}
