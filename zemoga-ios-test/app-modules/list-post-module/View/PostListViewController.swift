import UIKit

class PostListViewController: UIViewController {
    @IBOutlet weak var postSegmentedControl: UISegmentedControl!
    @IBOutlet weak var postListContentView: UIView!
    
    var presenter: ViewToPresenterPostListProtocol?
    private var postsViewController: UIViewController? = nil
    private var favoritesViewController: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PostListRouter.createPostListModule(postListReference: self)
        presenter?.startFetchigPostList()
        setupView()
    }
    
    func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func setupSegmentedControl() {
        postSegmentedControl.removeAllSegments()
        postSegmentedControl.insertSegment(withTitle: titles.allPost.rawValue, at: 0, animated: false)
        postSegmentedControl.insertSegment(withTitle: titles.favoritesPost.rawValue, at: 1, animated: false)
        postSegmentedControl.selectedSegmentIndex = 0
        postSegmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        postSegmentedControl.backgroundColor = .clear
        postSegmentedControl.tintColor = .clear
        postSegmentedControl.layer.borderWidth = 1
        postSegmentedControl.layer.borderColor = UIColor.systemGreen.cgColor
        postSegmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont(name: LatoFonts.regular, size: 16)!,
             NSAttributedString.Key.foregroundColor: UIColor.systemGreen],
            for: .normal)
        postSegmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font : UIFont(name: LatoFonts.regular, size: 16)!,
             NSAttributedString.Key.foregroundColor: UIColor.systemBackground],
            for: .selected)
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView() {
        if postSegmentedControl.selectedSegmentIndex == 0 {
            showAllPostScreen()
            return
        }
        
        showFavoritesScreen()
    }
    
    private func showAllPostScreen() {
        removeFirtsChildViewController()
        addContentView(getPostsViewController())
    }
    
    private func getPostsViewController() -> UIViewController {
        if postsViewController != nil {
            return postsViewController!
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let childViewController = storyboard.instantiateViewController(withIdentifier: Identifier.postsViewController)
        
        postsViewController = childViewController
        return postsViewController!
    }
    
    private func showFavoritesScreen() {
        self.removeFirtsChildViewController()
        addContentView(getFavoritesViewController())
    }
    
    private func getFavoritesViewController() -> UIViewController {
        if favoritesViewController != nil {
            return favoritesViewController!
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let childViewController = storyboard.instantiateViewController(withIdentifier: Identifier.favoritesViewController)
        
        favoritesViewController = childViewController
        return favoritesViewController!
    }
    
    private func removeFirtsChildViewController() {
        guard let childViewController = self.children.first else {
            return
        }
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
    
    private func addContentView(_ viewController: UIViewController) {
        addChild(viewController)
        postListContentView.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(screenConstraintsForContentView(viewController))
        viewController.didMove(toParent: self)
    }
    
    private func screenConstraintsForContentView(_ childViewController: UIViewController) -> [NSLayoutConstraint] {
        let topConstraint = childViewController.view.topAnchor.constraint(equalTo: postListContentView.topAnchor)
        let leadingConstraint = childViewController.view.leadingAnchor.constraint(equalTo: postListContentView.leadingAnchor)
        let bottomConstraint = postListContentView.bottomAnchor.constraint(equalTo: childViewController.view.bottomAnchor)
        let traillingConstraint = postListContentView.trailingAnchor.constraint(equalTo: childViewController.view.trailingAnchor)
        return [topConstraint, traillingConstraint, bottomConstraint, leadingConstraint]
    }

}

//MARK: - PresenterToView
extension PostListViewController: PresenterToViewPostListProtocol {
    func showPostList(with posts: [PostEntity]) {
        print("Showing post list")
    }
    
    func showError(_ error: Error) {
        print("show error post list")
    }
    
}

