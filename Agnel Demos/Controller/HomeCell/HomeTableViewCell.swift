//
//  HomeTableViewCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 30/11/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    let colorsList: [UIColor] = [.systemRed, .systemGreen, .systemOrange, .systemBlue]
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBtnData(index: Int){
        self.layoutMargins.top = 20
        demoLabel.text = "\(index). "
        var title = ""
        switch index {
        case 1:
            title = "Demo 1"
        case 2:
            title = "Demo 2"
        case 3:
            title = "Navigation, Collection and TableView Controller "
        case 4:
            title = "More in Navigation and TableView Controller"
        case 5:
            title = "More in Collection View Controller"
        default:
            title = "Demo 2"
        }
        
        titleLabel.text = title
    }
    
    
    
}
