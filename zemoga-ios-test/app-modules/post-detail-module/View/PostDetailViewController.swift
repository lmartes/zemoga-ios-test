import UIKit
import SVProgressHUD

class PostDetailViewController: UIViewController {
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var descriptionPost: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var phoneUser: UILabel!
    @IBOutlet weak var websiteUser: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    
    var presenter: ViewToPresenterPostDetailProtocol?
    private var comments: [CommentsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setDelegates()
        removeSectionHeaderTopPadding()
        requestData()
    }
    
    private func setDelegates() {
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
    
    private func removeSectionHeaderTopPadding() {
        if #available(iOS 15.0, *) {
            commentsTableView.sectionHeaderTopPadding = 0
        }
    }
    
    private func requestData() {
        SVProgressHUD.show(withStatus: "Loading data...")
        presenter?.startFetchigPostDetails()
    }
    
    private func setupPostSection(_ post: PostEntity) {
        descriptionPost.text = post.getBody().firstCapitalized
    }
    
    private func setupUserSection(_ user: UserEntity) {
        nameUser.text = user.getName()
        emailUser.text = user.getEmail()
        phoneUser.text = user.getPhone()
        websiteUser.text = user.getWebsite()
    }
    
    private func setupDataForCommentsSection(_ comments: [CommentsEntity]) {
        self.comments = comments
        commentsTableView.reloadData()
    }
    
    private func showContent() {
        contentStackView.isHidden = false
    }
    
}

//MARK: - PresenterToView
extension PostDetailViewController: PresenterToViewPostDetailProtocol {
    func setupView(post: PostEntity, user: UserEntity, comments: [CommentsEntity]) {
        SVProgressHUD.dismiss()
        setupPostSection(post)
        setupUserSection(user)
        setupDataForCommentsSection(comments)
        showContent()
    }
    
    func setupViewWithError(_ error: Error, endpoint: String) {
        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "Error: " + endpoint, message: error.localizedDescription + " Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Table View Delegate
extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commentsCell = tableView.dequeueReusableCell(withIdentifier: Identifiers.commentsCell) as? CommentsTableViewCell else {
            return UITableViewCell()
        }
        commentsCell.setupCell(comment: comments[indexPath.row])
        return commentsCell
    }
    
}
