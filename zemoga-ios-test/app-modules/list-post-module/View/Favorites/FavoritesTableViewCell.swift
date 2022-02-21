import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    func setupCell(post: PostEntity) {
        title.text = post.getTitle().firstCapitalized
        body.text = post.getBody().firstCapitalized
    }
}
