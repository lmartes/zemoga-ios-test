import Foundation
import UIKit

class ListPostRouter: PresenterToRouterListPostProtocol {
    static func createListPostModule(listPostDetailReference: ListPostViewController) {
        var presenter: ViewToPresenterListPostProtocol & InteractorToPresenterListPostProtocol = ListPostPresenter()
        //var presenter = ListPostPresenter()
        listPostDetailReference.presenter = presenter
        listPostDetailReference.presenter?.router = ListPostRouter()
        listPostDetailReference.presenter?.view = listPostDetailReference
        listPostDetailReference.presenter?.interactor = ListPostInteractor()
        listPostDetailReference.presenter?.interactor?.presenter = presenter
    }
    
    func pushToPostDetail(with post: PostEntity, from view: UIViewController) {
        print("Push to post details screen")
    }
    
}
