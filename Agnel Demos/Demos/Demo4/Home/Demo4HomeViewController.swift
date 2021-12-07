//
//  Demo4HomeViewController.swift
//  Agnel Demos
//
//  Created by Neosoft on 03/12/21.
//

import UIKit
import KeychainAccess

class Demo4HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let keyChain = Keychain(service: "com.test.Agnel-Demos")
    fileprivate var cell1Identifier = "tfCell"
    fileprivate var buttonCellIdentifier = "buttonCell"
    
    static func loadFromNib() -> Demo4HomeViewController {
        return Demo4HomeViewController(nibName: "Demo4HomeViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexFromString: "#E91C1A")
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        self.navigationController?.toolbar.tintColor = .white
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        
        let backImage = UIImage(systemName: "chevron.backward")
        backImage?.withTintColor(.white)
        let button = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(onBackButtonClicked))
        navigationItem.leftBarButtonItem = button
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        let searchImg = UIImage(systemName: "magnifyingglass")
        searchImg?.withTintColor(.white)
        let searchBtn = UIBarButtonItem(image: searchImg, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = searchBtn
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.title = "My Account"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "Demo4TFTVCell", bundle: nil), forCellReuseIdentifier: cell1Identifier)
        self.tableView.register(UINib(nibName: "ButtonTVCell", bundle: nil), forCellReuseIdentifier: buttonCellIdentifier)
        
    }
    
    @objc func onBackButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension Demo4HomeViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cell1Identifier, for: indexPath) as! Demo4TFTVCell
            updateTF(indexPath: indexPath, textField: cell.tf )
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: buttonCellIdentifier, for: indexPath) as! ButtonTVCell
            cell.registerBtn.setTitle("Logout", for: .normal)
            cell.registerBtn.setTitleColor(.red, for: .normal)
            cell.registerBtn.addTarget(self, action: #selector(onLogout), for: .touchDown)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cell1Identifier, for: indexPath) as! Demo4TFTVCell
            updateTF(indexPath: indexPath, textField: cell.tf )
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func updateTF(indexPath: IndexPath, textField: UITextField) {
        textField.addBorderToTF()
        textField.delegate = self
        textField.tag = indexPath.row
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                textField.changePlaceHolder(to: "First Name")
                textField.text = keyChain["firstName"]
                textField.addLeftImage(to: "person.crop.circle.fill")
            case 1:
                textField.changePlaceHolder(to: "Last Name")
                textField.text = keyChain["lasttName"]
                textField.addLeftImage(to: "person.crop.circle.fill")
            case 2:
                textField.changePlaceHolder(to: "Email")
                textField.text = keyChain["email"]
                textField.addLeftImage(to: "envelope.fill")
            case 3:
                textField.isSecureTextEntry = true
                textField.changePlaceHolder(to: "Password")
                textField.text = keyChain["password"]
                textField.addLeftImage(to: "lock.fill")
            case 4:
                textField.keyboardType = .numberPad
                textField.changePlaceHolder(to: "Phone Number")
                textField.text = keyChain["phoneNo"]
                textField.addLeftImage(to: "phone.fill")
            default:
                print("")
            }
        default:
            textField.tag = 5
            textField.keyboardType = .numberPad
            textField.changePlaceHolder(to: "Phone Number")
            textField.text = keyChain["phoneNumber"]
            textField.addLeftImage(to: "phone.fill")
        }
    }
       
    @objc func onLogout() {
        keyChain["firstName"] = nil
        keyChain["lasttName"] = nil
        keyChain["email"] = nil
        keyChain["password"] = nil
        keyChain["phoneNo"] = nil
        var viewControllers = self.navigationController?.viewControllers
        if(viewControllers != nil || viewControllers?.count == 0){
            viewControllers![(viewControllers!.count) - 1] = Demo4TVC.loadFromNib()
            self.navigationController?.setViewControllers(viewControllers!, animated: true)
            
        }
    }
}
