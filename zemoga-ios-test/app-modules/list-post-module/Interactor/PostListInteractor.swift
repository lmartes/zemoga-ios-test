import Foundation
import Alamofire
import ObjectMapper

class PostListInteractor: PresenterToInteractorPostListProtocol {
    var presenter: InteractorToPresenterPostListProtocol?
    
    func fetchPostList() {
        print("Get list post...")
        AF.request(API_POST_LIST).response { (response) in
            self.handleResponse(requestResponse: response)
        }
    }
    
    private func handleResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            presenter?.postListFetchFailed(with: error)
            return
        }
        
        if let data = requestResponse.data {
            print("data: ", data)
        }
    }
    
}