//
//  LabelCollectionViewCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    static var cellIdentifier = "labelCVC"
    
    static func loadFromNib() -> UINib {
        return UINib(nibName: "LabelCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
