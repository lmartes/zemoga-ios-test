import UIKit

class PostsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var persistenceUtils: PersistenceUtils = PersistenceUtils()
    private var allPosts: [PostEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setDelegates()
        allPosts = persistenceUtils.getUserDefaults()
        tableView.reloadData()
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func deleteAllPosts(_ sender: Any) {
        persistenceUtils.removeUserDefaults()
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
    
    
}
