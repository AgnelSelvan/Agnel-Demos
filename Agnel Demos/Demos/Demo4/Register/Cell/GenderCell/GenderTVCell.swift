//
//  GenderTVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 01/12/21.
//

import UIKit

class GenderTVCell: UITableViewCell {

    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    var isMale = true
    let circleImage  = UIImage(systemName: "circle")
    let circleFillImage  = UIImage(systemName: "circle.fill")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func maleBtnClick(_ sender: Any) {
        isMale = true
        updateCheckBtn()
    }

    @IBAction func femaleBtnClick(_ sender: Any) {
        isMale = false
        updateCheckBtn()
    }


    func updateCheckBtn() {
        if isMale{
            maleBtn.setImage(circleFillImage, for: .normal)
            femaleBtn.setImage(circleImage, for: .normal)
        }
        else{
            femaleBtn.setImage(circleFillImage, for: .normal)
            maleBtn.setImage(circleImage, for: .normal)

        }
    }
    
}
