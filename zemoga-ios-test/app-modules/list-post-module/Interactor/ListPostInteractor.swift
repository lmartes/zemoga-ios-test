import Foundation

class ListPostInteractor: PresenterToInteractorListPostProtocol {
    var presenter: InteractorToPresenterListPostProtocol?
    
    func fetchPostList() {
        print("Get list post...")
    }
    
}
