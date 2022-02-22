import Foundation

class PostDetailPresenter: ViewToPresenterPostDetailProtocol {
    var view: PresenterToViewPostDetailProtocol?
    var interactor: PresenterToInteractorPostDetailProtocol?
    var router: PresenterToRouterPostDetailProtocol?
    var post: PostEntity?
    
    func startFetchigPostDetails() {
        guard let post = post else {
            return
        }
        interactor?.fetchDataBasedOnPost(post)
    }
    
}

extension PostDetailPresenter: InteractorToPresenterPostDetailProtocol {
    func dataBasedOnPostFetchedSuccess(post: PostEntity, user: UserEntity, comments: [CommentsEntity]) {
        view?.setupView(post: post, user: user, comments: comments)
    }
    
    func dataBasedOnPostFetchedFailed(with error: Error, endpoint: String) {
        view?.setupViewWithError(error, endpoint: endpoint)
    }
    
}
