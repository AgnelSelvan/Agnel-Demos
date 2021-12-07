//
//  ModulesCVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

class ModulesCVCell: UICollectionViewCell {
    static var cellIdentifier = "modulesCVCell"
    static func loadFromNib() -> UINib {
        return UINib(nibName: "ModulesCVCell", bundle: nil)
    }
    
    @IBOutlet weak var goalBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        goalBtn.addBorder(UIColor.init(hexFromString: "0D1155") ?? .white)
    }

}
