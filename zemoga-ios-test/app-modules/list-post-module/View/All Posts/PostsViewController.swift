import UIKit
import SVProgressHUD

class PostsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewToPresenterPostListProtocol?
    private var persistenceUtils: PersistenceUtils = PersistenceUtils()
    private var allPosts: [PostEntity] = []
    private let refreshControl = UIRefreshControl()
    private var timer: Timer = Timer()
    private var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setDelegates()
        addRefreshControl()
        allPosts = persistenceUtils.getUserDefaults()
        tableView.reloadData()
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.startUpdatingPostList()
        refreshControl.endRefreshing()
    }

    @IBAction func deleteAllPosts(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Deleting posts...")
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter += 1
            if self.counter == 2 {
                SVProgressHUD.dismiss()
                timer.invalidate()
                self.deleteData()
            }
        }
    }
    
    private func deleteData() {
        persistenceUtils.removeUserDefaults()
        allPosts = persistenceUtils.getUserDefaults()
        tableView.reloadData()
    }
    
    func refreshView() {
        allPosts = persistenceUtils.getUserDefaults()
        tableView.reloadData()
    }
    
}

//MARK: - Table View Delegate
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let postsCell = tableView.dequeueReusableCell(withIdentifier: Identifiers.postsCell) as? PostsTableViewCell else {
            return UITableViewCell()
        }
        postsCell.setupCell(with: allPosts[indexPath.row])
        return postsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPostDetail(with: allPosts[indexPath.row], from: self)
    }
    
}
