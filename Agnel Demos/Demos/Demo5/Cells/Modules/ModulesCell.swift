//
//  ModulesCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

class ModulesCell: UICollectionViewCell {
    
    static var cellIdentifier = "modulesCell"
    static func loadFromNib() -> UINib {
        return UINib(nibName: "ModulesCell", bundle: nil)
    }

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var chapters: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateModulesCell(module: Modules) {
        chapters.text = "\(module.chapters) Chapters"
        title.text = "\(module.title)"
        if let ogImage = UIImage(systemName: module.image){
            image.image = ogImage
        }
        else{
            image.image = UIImage(systemName: "camera.metering.unknown")!
        }
        image.tintColor = module.color
        headerView.backgroundColor = module.color.withAlphaComponent(0.2)
        
        self.layer.cornerRadius = 10
        
    }

}
