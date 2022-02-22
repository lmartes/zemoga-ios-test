import Foundation

protocol ViewToPresenterPostDetailProtocol: AnyObject {
    var view: PresenterToViewPostDetailProtocol? { get set }
    var interactor: PresenterToInteractorPostDetailProtocol? { get set }
    var router: PresenterToRouterPostDetailProtocol? { get set }
    func startFetchigPostDetails()
}

protocol PresenterToViewPostDetailProtocol: AnyObject {
    func setupView(post: PostEntity, user: UserEntity, comments: [CommentsEntity])
    func setupViewWithError(_ error: Error, endpoint: String)
}

protocol PresenterToInteractorPostDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterPostDetailProtocol? { get set }
    func fetchDataBasedOnPost(_ post: PostEntity)
}

protocol PresenterToRouterPostDetailProtocol: AnyObject {
    static func createdPostDetailModule(postDetailReference: PostDetailViewController, and post: PostEntity)
}

protocol InteractorToPresenterPostDetailProtocol: AnyObject {
    func dataBasedOnPostFetchedSuccess(post: PostEntity, user: UserEntity, comments: [CommentsEntity])
    func dataBasedOnPostFetchedFailed(with error: Error, endpoint: String)
}
