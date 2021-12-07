
import UIKit
import KeychainAccess

fileprivate var cellIdentifier = "cell"

class HomeViewController: UIViewController {
    let keyChain = Keychain(service: "com.test.Agnel-Demos")
    var count = 5
    @IBOutlet weak var screenTableView: UITableView!
    
    static func loadFromNib() -> HomeViewController {
        return HomeViewController(nibName: "HomeViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = true
        screenTableView.delegate = self
        screenTableView.dataSource = self
        screenTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.navigationController?.navigationBar.backgroundColor = .white
        
        let edgeInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        screenTableView.contentInset = edgeInset
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
//        cell.inputViewController = self
        cell.setBtnData(index: indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row : \(indexPath.row)")
        switch indexPath.row {
        case 3:
            if keyChain["firstName"] != nil{
                self.navigationController?.pushViewController(Demo4HomeViewController.loadFromNib(), animated: true)

            }
            else{
                self.navigationController?.pushViewController(Demo4TVC.loadFromNib(), animated: true)
            }
        case 4:
            self.navigationController?.pushViewController(Demo5CollectionViewController.loadFromNib(), animated: true)
        default:
            print(indexPath.row)
        }
    }
    
}
