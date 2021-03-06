import Foundation
import UIKit

class PostListRouter: PresenterToRouterPostListProtocol {
    static func createPostListModule(postListReference: PostListViewController) {
        let presenter: ViewToPresenterPostListProtocol & InteractorToPresenterPostListProtocol = PostListPresenter()
        postListReference.presenter = presenter
        postListReference.presenter?.router = PostListRouter()
        postListReference.presenter?.view = postListReference
        postListReference.presenter?.interactor = PostListInteractor()
        postListReference.presenter?.interactor?.presenter = presenter
    }
    
    func pushToPostDetail(with post: PostEntity, from view: UIViewController) {
        guard let postDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: Identifiers.postDetailViewController) as? PostDetailViewController else {
            return
        }
        PostDetailRouter.createdPostDetailModule(postDetailReference: postDetailViewController, and: post)
        view.navigationController?.pushViewController(postDetailViewController, animated: true)
    }
    
}
