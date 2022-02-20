import Foundation
import ObjectMapper

struct PostEntity: Mappable {
    private var userId: Int = 0
    private var id: Int = 0
    private var title: String = ""
    private var body: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
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
    
}
