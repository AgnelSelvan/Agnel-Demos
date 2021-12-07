//
//  TermsConditionTVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 01/12/21.
//

import UIKit

class TermsConditionTVCell: UITableViewCell {
    var isChecked = false
    @IBOutlet weak var checkBtnImg: UIButton!
    
    @IBOutlet weak var termsAndConditionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//                termsAndConditionLabel.addGestureRecognizer( UIGestureRecognizer(target: self, action: #selector(openTermsCondition)) )
    }
    
    @IBAction func onCheckBtnTap() {
        print("Tapped Check Button")
        isChecked = !isChecked
        updateCheckBtn()
    }
    
    @objc func openTermsCondition(){
        if let url = URL(string: "https://www.neosofttech.com/terms-use#:~:text=NeoSOFT%20technologies%20and%20its%20directors,on%20the%20site%2C%20(c)") {
            UIApplication.shared.open(url)
        }
    }
    
    func updateCheckBtn() {
        if isChecked{
            let image  = UIImage(systemName: "square.fill")
            checkBtnImg.setImage(image, for: .normal)
            print("Accepted Terms and Condition")
        }
        else{
            let image = UIImage(systemName: "square")
            checkBtnImg.setImage(image, for: .normal)
            print("Not Accepted Terms and Condition")
        }
    }
}
