import Foundation
import UIKit

protocol ViewToPresenterListPostProtocol: AnyObject {
    var view: PresenterToViewListPostProtocol? { get set }
    var interactor: PresenterToInteractorListPostProtocol? { get set }
    var router: PresenterToRouterListPostProtocol? { get set }
    func startFetchigPostList()
    func showPostDetail(with post: PostEntity, from view: UIViewController)
}

protocol PresenterToViewListPostProtocol: AnyObject {
    func showPostList(with posts: [PostEntity])
    func showError(_ error: Error)
}

protocol PresenterToInteractorListPostProtocol: AnyObject {
    var presenter: InteractorToPresenterListPostProtocol? { get set }
    func fetchPostList()
}

protocol PresenterToRouterListPostProtocol: AnyObject {
    static func createListPostModule(listPostDetailReference: ListPostViewController)
    func pushToPostDetail(with post: PostEntity, from view: UIViewController)
}

protocol InteractorToPresenterListPostProtocol: AnyObject {
    func listPostFetchedSuccess(posts: [PostEntity])
    func listPostFetchFailed(with error : Error)
}
