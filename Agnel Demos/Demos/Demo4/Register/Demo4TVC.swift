import UIKit
import KeychainAccess
import MapKit

struct RegisterTF {
    var firstName : String
    var lastName : String
    var email: String
    var password : String
    var confirmPassword: String
    var phoneNumber: String
}

struct UserModel{
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var phoneNumber: Int
    var isMale: Bool
    
}

enum NameError: String, Error{
    case fill = "Please enter Name"
    case short = "Name length has to be more than 3"
}

enum EmailError: String, Error{
    case empty = "Please enter email"
    case notValid = "Please enter a valid email"
}

enum PasswordError: String, Error{
    case empty = "Please enter Password"
    case short = "Please Enter password of more than 8 character"
    case notValid = "Password should contain symbols like @,#... ,Digits and Alphabets "
    case notMatch = "Password doesnot match"
}

enum PhoneError: String, Error{
    case empty = "Please Enter Phone Number"
    case notValid = "Phone no. is not valid "
}

class Demo4TVC: UITableViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    fileprivate var cellIdentifier = "labelCell"
    fileprivate var cell1Identifier = "tfCell"
    fileprivate var genderIdentifier = "genderCell"
    fileprivate var tcCellIdentifier = "tcCell"
    fileprivate var buttonCellIdentifier = "buttonCell"
    let keyChain = Keychain(service: "com.test.Agnel-Demos")
    var isMale = true
    var isChecked = false
    var registerData = RegisterTF(firstName: "", lastName: "", email: "", password: "", confirmPassword: "", phoneNumber: "")
    
    static func loadFromNib() -> Demo4TVC {
        return Demo4TVC(nibName: "Demo4TVC", bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexFromString: "#E91C1A")
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexFromString: "#E91C1A")
        self.navigationController?.toolbar.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.tableView.tintColor = .white

        self.tableView.register(UINib(nibName: "Demo4TVCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.register(UINib(nibName: "Demo4TFTVCell", bundle: nil), forCellReuseIdentifier: cell1Identifier)
        self.tableView.register(UINib(nibName: "GenderTVCell", bundle: nil), forCellReuseIdentifier: genderIdentifier)
        self.tableView.register(UINib(nibName: "TermsConditionTVCell", bundle: nil), forCellReuseIdentifier: tcCellIdentifier)
        self.tableView.register(UINib(nibName: "ButtonTVCell", bundle: nil), forCellReuseIdentifier: buttonCellIdentifier)
        self.navigationItem.title = "Register"
        
        let backImage = UIImage(systemName: "chevron.backward")
        backImage?.withTintColor(.white)
        let button = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(onBackButtonClicked))
        navigationItem.leftBarButtonItem = button
        navigationItem.leftBarButtonItem?.tintColor = .white
        
    }
    
    
    @objc func onBackButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 , 2 , 3 , 4 , 5:
            return 1
        case 1:
            return 5
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Demo4TVCell
            return cell
        case 1, 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: cell1Identifier, for: indexPath) as! Demo4TFTVCell
            updateTF(indexPath: indexPath, textField: cell.tf )
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: genderIdentifier, for: indexPath) as! GenderTVCell
            
//            cell.maleBtn.addTarget(self, action: #selector(maleBtnClick), for: .touchDown)
//            cell.femaleBtn.addTarget(self, action: #selector(femaleBtnClick), for: .touchDown)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: tcCellIdentifier, for: indexPath) as! TermsConditionTVCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: buttonCellIdentifier, for: indexPath) as! ButtonTVCell
            cell.registerBtn.setTitle("Register", for: .normal)
            cell.registerBtn.setTitleColor(.red, for: .normal)
            cell.registerBtn.addTarget(self, action: #selector(onRegisterBtnClicked), for: .touchDown)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            return cell
        }

    }
    
    func showErrorDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func onRegisterBtnClicked(){
        NSLog("Is Male ? \(isMale)")
        if isChecked{
            do {
                _ = try registerData.firstName.isNameValid()
                _ = try registerData.lastName.isNameValid()
                _ = try registerData.email.isEmailValid()
                _ = try registerData.password.isPasswordValid()
                _ = try registerData.phoneNumber.isPhoneNumberValid()
                if registerData.password != registerData.confirmPassword{
                    throw PasswordError.notMatch
                }
                
                let indexPath = IndexPath(row: 0, section: 4)
                let cell = self.tableView.cellForRow(at: indexPath) as! TermsConditionTVCell
                
                if cell.isChecked {
                    print("Registered...")
                }
    //            showErrorDialog(title: "Error", message: "Accept the terms and condition to register")
                
                let user = UserModel(firstName: registerData.firstName, lastName: registerData.lastName, email: registerData.email, password: registerData.password, phoneNumber: Int(registerData.phoneNumber)!, isMale: isMale)
                keyChain["firstName"] = user.firstName
                keyChain["lasttName"] = user.lastName
                keyChain["email"] = user.email
                keyChain["password"] = user.password
                keyChain["phoneNo"] = "\(user.phoneNumber)"
                keyChain["isMale"] = "\(user.isMale)"
                var viewControllers = self.navigationController?.viewControllers
                if(viewControllers != nil || viewControllers?.count == 0){
                    viewControllers![(viewControllers!.count) - 1] = Demo4HomeViewController.loadFromNib()
                    self.navigationController?.setViewControllers(viewControllers!, animated: true)
                    
                }
                
            } catch let error as NameError {
                showErrorDialog(title: "Error", message: error.rawValue)
            } catch let error as EmailError {
                showErrorDialog(title: "Error", message: error.rawValue)
            }  catch let error as PasswordError {
                showErrorDialog(title: "Error", message: error.rawValue)
            }  catch let error as PhoneError {
                showErrorDialog(title: "Error", message: error.rawValue)
            } catch {
                showErrorDialog(title: "Unknown Error", message: "\(error)")
            }
        }
        else{
            showErrorDialog(title: "Terms and Condition", message: "Please Accept Terms and Condition")
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            print("Title")
        case 1:
            print("TextField")
        case 2:
            let cell = tableView.cellForRow(at: indexPath) as! GenderTVCell
            print("Gender: \(cell.isMale)")
            cell.backgroundColor = UIColor(hexFromString: "E91C1A")
//            cell.contentView.backgroundColor = UIColor(hexFromString: "E91C1A")
            
            isMale = cell.isMale
        case 4:
            let cell = tableView.cellForRow(at: indexPath) as! TermsConditionTVCell
            print("Accepte Terms and conditions ? \(cell.isChecked)")
//            cell.contentView.backgroundColor = UIColor(hexFromString: "E91C1A")
            isChecked = cell.isChecked
        default:
            print("")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor(hexFromString: "E91C1A")
    }
    
    @objc func maleBtnClick() {
        isMale = true
        print("Is Male? \(isMale)")
        updateCheckBtn()
    }
    
    @objc func femaleBtnClick() {
        isMale = false
        print("Is Male? \(isMale)")
        updateCheckBtn()
    }
    
    
    func updateCheckBtn() {
//        print(tableView.cellForRow(at: IndexPath(row: 1, section: 2)))
        let indexPath = IndexPath(row: 0, section: 2)
        let cell = self.tableView.cellForRow(at: indexPath) as! GenderTVCell

        if isMale{
            cell.maleBtn.setImage(cell.circleFillImage, for: .normal)
            cell.femaleBtn.setImage(cell.circleImage, for: .normal)
        }
        else{
            cell.femaleBtn.setImage(cell.circleFillImage, for: .normal)
            cell.maleBtn.setImage(cell.circleImage, for: .normal)

        }
        
        self.tableView.cellForRow(at: indexPath)?.reloadInputViews()
    }
    

    
    
    func updateTF(indexPath: IndexPath, textField: UITextField) {
        textField.addBorderToTF()
        textField.delegate = self
        textField.tag = indexPath.row
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                textField.changePlaceHolder(to: "First Name")
                textField.addLeftImage(to: "person.crop.circle.fill")
            case 1:
                textField.changePlaceHolder(to: "Last Name")
                textField.addLeftImage(to: "person.crop.circle.fill")
            case 2:
                textField.changePlaceHolder(to: "Email")
                textField.addLeftImage(to: "envelope.fill")
            case 3:
                textField.isSecureTextEntry = true
                textField.changePlaceHolder(to: "Password")
                textField.addLeftImage(to: "lock.fill")
            case 4:
                textField.isSecureTextEntry = true
                textField.changePlaceHolder(to: "Confirm Password")
                textField.addLeftImage(to: "lock.fill")
            default:
                textField.changePlaceHolder(to: "Last Name" )
            }
        default:
            textField.tag = 5
            textField.keyboardType = .numberPad
            textField.changePlaceHolder(to: "Phone Number")
            textField.addLeftImage(to: "phone.fill")
        }
    }
        
}

extension Demo4TVC{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        let kActualText = (textField.text ?? "") + string
        print(textField.tag)
        switch textField.tag {
        case 0:
            registerData.firstName = kActualText
        case 1:
            registerData.lastName = kActualText
        case 2:
            registerData.email = kActualText
        case 3:
            registerData.password = kActualText
        case 4:
            registerData.confirmPassword = kActualText
        case 5:
            registerData.phoneNumber = kActualText
        default:
            print("Oops Something fishy!")
        }
        return true
    }
}

extension String{
    func isNameValid() throws -> String {
        if self.count == 0{
            throw NameError.fill
        }
        else if self.count <= 3{
            throw NameError.short
        }
        return self
    }
    
    func isEmailValid() throws -> String {
        if self.count == 0{
            throw EmailError.empty
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValid =  emailPred.evaluate(with: self)
        print("Email Validation : \(isValid)")
        if isValid{
            return self
        }
        
        throw EmailError.notValid
    }
    
    func isPasswordValid() throws -> String {
        if self.count == 0{
            throw PasswordError.empty
        }
        else if self.count < 8 {
            throw PasswordError.short
        }
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let isValid = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
        if isValid{
            return self
        }
        throw PasswordError.notValid
    }
    
    func isPhoneNumberValid() throws -> String {
        if self.count == 0{
            throw PhoneError.empty
        }
        else if self.count != 10 || Int(self) == nil {
            throw PhoneError.notValid
        }
        return self
    }
}

extension UITextField{
    
    func changePlaceHolder(to text: String){
        
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    
    func addLeftImage(to image: String) {
        if let myImage = UIImage(systemName: image){
            self.withImage(image: myImage, viewBGColor: UIColor(hexFromString: "E91C1A" ))
        }
    }
}
