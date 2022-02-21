import Foundation
import Alamofire
import ObjectMapper

class PostListInteractor: PresenterToInteractorPostListProtocol {
    var presenter: InteractorToPresenterPostListProtocol?
    private var persistenceUtils: PersistenceUtils = PersistenceUtils()
    
    func fetchPostList() {
        if persistenceUtils.postListOnUserDefaultsIsEmpty() == false {
            presenter?.postListFetchedSuccess()
            return
        }
        
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
            let allPosts = parseJSON(data)
            persistenceUtils.saveUserDefaults(allPosts)
            presenter?.postListFetchedSuccess()
        }
    }
    
    private func parseJSON(_ postListData: Data) -> [PostEntity] {
        let data = String(decoding: postListData, as: UTF8.self)
        guard let decoderData = Mapper<PostEntity>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        return decoderData
    }
    
}
