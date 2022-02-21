import Foundation
import Alamofire
import ObjectMapper

class PostDetailInteractor: PresenterToInteractorPostDetailProtocol {
    var presenter: InteractorToPresenterPostDetailProtocol?
    private var user: UserEntity?
    private var comments: [CommentsEntity] = []
    
    func fetchDataBasedOnPost(_ post: PostEntity) {
        startRequests(userId: post.getUserId(), postId: post.getId())
    }
    
    private func startRequests(userId: Int, postId: Int) {
        AF.request(API_GET_USER + "\(userId)").response { (response) in
            self.handleUserResponse(requestResponse: response)
            self.requestComments(postId: postId)
        }
    }
    
    private func handleUserResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            presenter?.dataBasedOnPostFetchedFailed(with: error, endpoint: API_GET_USER)
            return
        }
        
        if let data = requestResponse.data {
            user = parseJSONForUserResponse(data)
        }
    }
    
    private func parseJSONForUserResponse(_ userData: Data) -> UserEntity? {
        let data = String(decoding: userData, as: UTF8.self)
        guard let decoderData = Mapper<UserEntity>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response to UserEntity")
            return user
        }
        return decoderData.first
    }
    
    private func requestComments(postId: Int) {
        AF.request(API_GET_COMMENTS + "\(postId)").response { (response) in
            self.handleCommentsResponse(requestResponse: response)
            if let user = self.user {
                self.presenter?.dataBasedOnPostFetchedSuccess(user: user, comments: self.comments)
            }
        }
    }
    
    private func handleCommentsResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            presenter?.dataBasedOnPostFetchedFailed(with: error, endpoint: API_GET_COMMENTS)
            return
        }
        
        if let data = requestResponse.data {
            comments = parseJSONForCommentsResponse(data)
        }
    }
    
    private func parseJSONForCommentsResponse(_ commentsData: Data) -> [CommentsEntity] {
        let data = String(decoding: commentsData, as: UTF8.self)
        guard let decoderData = Mapper<CommentsEntity>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response to CommentsEntity")
            return comments
        }
        return decoderData
    }
    
}
