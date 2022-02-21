import Foundation
import UIKit

class PostListPresenter: ViewToPresenterPostListProtocol {
    var view: PresenterToViewPostListProtocol?
    var interactor: PresenterToInteractorPostListProtocol?
    var router: PresenterToRouterPostListProtocol?
    
    func startFetchigPostList() {
        interactor?.fetchPostList()
    }
    
    func showPostDetail(with post: PostEntity, from view: UIViewController) {
        router?.pushToPostDetail(with: post, from: view)
    }
    
}

extension PostListPresenter: InteractorToPresenterPostListProtocol {
    func postListFetchedSuccess() {
        view?.setupView()
    }
    
    func postListFetchFailed(with error: Error) {
        view?.setupViewWithError(error)
    }
    
    
}
