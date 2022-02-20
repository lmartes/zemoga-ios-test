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
        print("Push to post details screen")
    }
    
}
