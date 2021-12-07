//
//  ButtonTVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 01/12/21.
//

import UIKit

class ButtonTVCell: UITableViewCell {

    @IBOutlet weak var registerBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func registerBtnClick(_ sender: Any) {
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
