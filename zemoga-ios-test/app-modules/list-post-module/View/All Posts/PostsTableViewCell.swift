import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var statusIcon: UIImageView!
    
    func setupCell(with post: PostEntity) {
        title.text = post.getTitle().firstCapitalized
        statusIcon.image = setIcon(status: post.getStatus())
    }
    
    private func setIcon(status: PostStatus) -> UIImage? {
        switch status {
        case .pendingReview:
            return UIImage(systemName: Icons.circleFill)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        case .notFavorite:
            return UIImage(systemName: Icons.circleFill)?.withTintColor(.clear, renderingMode: .alwaysOriginal)
        case .isFavorite:
            return UIImage(systemName: Icons.starFill)?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        }
    }

}
