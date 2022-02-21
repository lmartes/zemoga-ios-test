import Foundation
import ObjectMapper

struct UserEntity: Mappable {
    private var id: Int = 0
    private var name: String = ""
    private var email: String = ""
    private var phone: String = ""
    private var website: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        phone <- map["phone"]
        website <- map["website"]
    }
    
    func getId() -> Int {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getPhone() -> String {
        return phone
    }
    
    func getWebsite() -> String {
        return website
    }
    
}
