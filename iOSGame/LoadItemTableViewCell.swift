import UIKit

class LoadItemTableViewCell: UITableViewCell {
    @IBOutlet weak var saveName: UILabel!
    @IBOutlet weak var saveDate: UILabel!
    @IBOutlet weak var character: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
}
