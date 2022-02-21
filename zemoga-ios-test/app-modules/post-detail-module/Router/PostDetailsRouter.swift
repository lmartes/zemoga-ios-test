import Foundation

class PostDetailRouter: PresenterToRouterPostDetailProtocol {
    static func createdPostDetailModule(postDetailReference: PostDetailViewController, and post: PostEntity) {
        let presenter = PostDetailPresenter()
        presenter.post = post
        postDetailReference.presenter = presenter
        postDetailReference.presenter?.router = PostDetailRouter()
        postDetailReference.presenter?.view = postDetailReference
        postDetailReference.presenter?.interactor = PostDetailInteractor()
        postDetailReference.presenter?.interactor?.presenter = presenter
    }
    
    deinit {
        print("PostDetailsRouter removed")
    }
}
