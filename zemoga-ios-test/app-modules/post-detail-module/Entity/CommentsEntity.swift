import Foundation
import ObjectMapper

struct CommentsEntity: Mappable {
    private var id: Int = 0
    private var body: String = ""
    private var email: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        body <- map["body"]
        email <- map["email"]
    }
    
    func getId() -> Int {
        return id
    }
    
    func getBody() -> String {
        return body
    }
    
    func getEmail() -> String {
        return email
    }
    
}
