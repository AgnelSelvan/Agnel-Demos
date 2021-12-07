//
//  Demo4TFTVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 01/12/21.
//

import UIKit

class Demo4TFTVCell: UITableViewCell {

    @IBOutlet weak var tf: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
          nextField.becomeFirstResponder()
       } else {
          textField.resignFirstResponder()
       }
       return true
    }
}

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
extension UITextField{
    func addBorderToTF() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 1
        self.layer.borderWidth = CGFloat(1)
        self.layer.cornerRadius = 5
        
    }
    
    func withImage( image: UIImage, viewBGColor: UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 5

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = viewBGColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        imageView.tintColor = .white
        view.addSubview(imageView)
        
        
        let clearImage = UIImage(systemName: "xmark.circle.fill")!
        self.clearButtonWithImage(clearImage)

        self.leftViewMode = .always
        self.leftView = mainView
        

    }
    
    func clearButtonWithImage(_ image: UIImage) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        let clearButton = UIButton()
        clearButton.setImage(image, for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(self.clear(sender:)), for: .touchUpInside)
        mainView.addSubview(clearButton)
        self.rightView = mainView
        self.rightViewMode = .whileEditing
    }
    
    @objc func clear(sender: AnyObject) {
        self.text = ""
    }
}
