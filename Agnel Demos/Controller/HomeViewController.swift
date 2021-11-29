
import UIKit


class HomeViewController: UIViewController {
    var count = 4
    @IBOutlet weak var tableView: UITableView!
    
    static func loadFromNib() -> HomeViewController {
        return HomeViewController(nibName: "HomeViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
