import Foundation
import ObjectMapper

class PersistenceUtils {
    let userDefaults = UserDefaults.standard
    
    func saveUserDefaults(_ postList: [PostEntity]) {
        guard let data = postList.toJSONString(prettyPrint: false) else {
            return
        }
        userDefaults.set(data, forKey: UserDefaultsKeys.postsList)
        userDefaults.synchronize()
    }
    
    func getUserDefaults() -> [PostEntity] {
        guard let postListDefaults = userDefaults.string(forKey: UserDefaultsKeys.postsList) else {
            return []
        }
        guard let userList = Mapper<PostEntity>().mapArray(JSONString: postListDefaults) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        return userList
    }
    
    func removeUserDefaults() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.postsList)
        userDefaults.synchronize()
    }
    
    func postListOnUserDefaultsIsEmpty() -> Bool {
        return PersistenceUtils().getUserDefaults().isEmpty
    }
    
}
