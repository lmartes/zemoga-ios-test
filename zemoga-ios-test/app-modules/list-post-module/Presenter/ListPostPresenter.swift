import Foundation
import UIKit

class ListPostPresenter: ViewToPresenterListPostProtocol {
    var view: PresenterToViewListPostProtocol?
    var interactor: PresenterToInteractorListPostProtocol?
    var router: PresenterToRouterListPostProtocol?
    
    func startFetchigPostList() {
        interactor?.fetchPostList()
    }
    
    func showPostDetail(with post: PostEntity, from view: UIViewController) {
        router?.pushToPostDetail(with: post, from: view)
    }
    
}

extension ListPostPresenter: InteractorToPresenterListPostProtocol {
    func listPostFetchedSuccess(posts: [PostEntity]) {
        print("list post success")
    }
    
    func listPostFetchFailed(with error: Error) {
        print("list post error")
    }
    
    
}
