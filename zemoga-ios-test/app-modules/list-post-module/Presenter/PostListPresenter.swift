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
    func postListFetchedSuccess(posts: [PostEntity]) {
        print("list post success")
    }
    
    func postListFetchFailed(with error: Error) {
        print("list post error")
    }
    
    
}
