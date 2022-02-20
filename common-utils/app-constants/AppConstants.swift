import Foundation

let API_POST_LIST = "https://jsonplaceholder.typicode.com/posts"

enum titles: String {
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

struct Identifier {
    static let postsViewController = "PostsViewControllerIdentifier"
    static let favoritesViewController = "FavoritesViewControllerIdentifier"
}
