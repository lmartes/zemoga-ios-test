import UIKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func setupCell(comment: CommentsEntity) {
        body.text = comment.getBody().firstCapitalized
        email.text = "- " + comment.getEmail()
    }
}
