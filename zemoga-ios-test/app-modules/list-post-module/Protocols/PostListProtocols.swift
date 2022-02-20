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
    func showPostList(with posts: [PostEntity])
    func showError(_ error: Error)
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
    func postListFetchedSuccess(posts: [PostEntity])
    func postListFetchFailed(with error : Error)
}
