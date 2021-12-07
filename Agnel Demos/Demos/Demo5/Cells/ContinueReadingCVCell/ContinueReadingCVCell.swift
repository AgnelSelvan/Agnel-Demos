//
//  ContinueReadingCVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

class ContinueReadingCVCell: UICollectionViewCell {
    static var cellIdentifier = "ContinueReadingCVCell"
    
    static func loadFromNib() -> UINib {
        return UINib(nibName: "ContinueReadingCVCell", bundle: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var completedPercentageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateContinueReadingCell(module: Modules){
        self.backgroundColor = module.color.withAlphaComponent(0.2)
        self.imageView.image = UIImage(systemName: module.image)!
        imageView.tintColor = module.color
        
        let percentage: Double = (Double(module.completedChapters) / Double(module.chapters)) * 100
        print("Percentage: \(percentage)")
        
        completedPercentageLabel.text = "\(percentage.rounded())% Completed"
        completedLabel.text = "\(module.completedChapters) / \(module.chapters)"
        titleLabel.text = module.title
        
        progressView.tintColor = module.color
        progressView.backgroundColor = module.color.withAlphaComponent(0.1)
        
        
        
        progressView.setProgress(Float(percentage / 100), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        
    }
}

extension Double {
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
