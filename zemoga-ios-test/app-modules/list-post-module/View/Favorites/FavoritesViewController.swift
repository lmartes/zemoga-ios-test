import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var favoritesTableView: UITableView!
    
    private var persistenceUtils: PersistenceUtils = PersistenceUtils()
    var favoritesPost: [PostEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setDelegates()
        getFavoritesPost()
        favoritesTableView.reloadData()
    }
    
    private func setDelegates() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    private func getFavoritesPost() {
        let allPost = persistenceUtils.getUserDefaults()
        favoritesPost = allPost.filter { $0.getStatus() == .isFavorite }
    }
    
}

//MARK: - Table View Delegates
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoritesCell = tableView.dequeueReusableCell(withIdentifier: Identifiers.favoritesCell) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        favoritesCell.setupCell(post: favoritesPost[indexPath.row])
        return favoritesCell
    }
    
    
}
