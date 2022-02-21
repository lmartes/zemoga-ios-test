import Foundation
import ObjectMapper

struct PostEntity: Mappable {
    private var userId: Int = 0
    private var id: Int = 0
    private var title: String = ""
    private var body: String = ""
    private var status: PostStatus = .pendingReview
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        status <- map["status"]
    }
    
    func getUserId() -> Int {
        return userId
    }
    
    func getId() -> Int {
        return id
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getBody() -> String {
        return body
    }
    
    mutating func setStatus(_ status: PostStatus) {
        self.status = status
    }
    
    func getStatus() -> PostStatus {
        return status
    }
    
}
