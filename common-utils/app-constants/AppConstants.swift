import Foundation

let API_GET_POST_LIST = "https://jsonplaceholder.typicode.com/posts"
let API_GET_USER = "https://jsonplaceholder.typicode.com/users?id="
let API_GET_COMMENTS = "https://jsonplaceholder.typicode.com/comments?postId="

enum Titles: String {
    case allPost = "All"
    case favoritesPost = "Favorites"
}

struct LatoFonts {
    static let black = "Lato-Black"
    static let blackItalic = "Lato-BlackItalic"
    static let bold = "Lato-Bold"
    static let boldItalic = "Lato-Italic"
    static let italic = "Lato-Italic"
    static let light = "Lato-Light"
    static let lightItalic = "Lato-LightItalic"
    static let regular = "Lato-Regular"
    static let thin = "Lato-Thin"
    static let thinItalic = "Lato-ThinItalic"
}

struct Icons {
    static let circleFill = "circle.fill"
    static let starFill = "star.fill"
}

struct Identifiers {
    static let postsViewController = "PostsViewControllerIdentifier"
    static let postsCell = "postCellIdentifier"
    static let favoritesViewController = "FavoritesViewControllerIdentifier"
    static let postDetailViewController = "PostDetailViewControllerIdentifier"
    static let commentsCell = "commentsCellIdentifier"
}

struct UserDefaultsKeys {
    static let postsList = "PostsListDefaults"
}
