import Foundation

extension String {
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
