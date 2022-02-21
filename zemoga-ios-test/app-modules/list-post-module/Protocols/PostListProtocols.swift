import Foundation
import UIKit

protocol ViewToPresenterPostListProtocol: AnyObject {
    var view: PresenterToViewPostListProtocol? { get set }
    var interactor: PresenterToInteractorPostListProtocol? { get set }
    var router: PresenterToRouterPostListProtocol? { get set }
    func startFetchigPostList()
    func showPostDetail(with post: PostEntity, from view: UIViewController)
}

protocol PresenterToViewPostListProtocol: AnyObject {
    func setupView()
    func setupViewWithError(_ error: Error)
}

protocol PresenterToInteractorPostListProtocol: AnyObject {
    var presenter: InteractorToPresenterPostListProtocol? { get set }
    func fetchPostList()
}

protocol PresenterToRouterPostListProtocol: AnyObject {
    static func createPostListModule(postListReference: PostListViewController)
    func pushToPostDetail(with post: PostEntity, from view: UIViewController)
}

protocol InteractorToPresenterPostListProtocol: AnyObject {
    func postListFetchedSuccess()
    func postListFetchFailed(with error : Error)
}
