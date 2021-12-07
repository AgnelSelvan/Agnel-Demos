//
//  GoalsCVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

class GoalsCVCell: UICollectionViewCell {
    
    static var cellIdentifier = "goalsCVCell"
    
    static func loadFromNib() -> UINib {
        return UINib(nibName: "GoalsCVCell", bundle: nil)
    }
    
    @IBOutlet weak var goalBtn: UIButton!
    @IBOutlet weak var progressBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        goalBtn.addBorder()
        progressBtn.addBorder()
    }

}
