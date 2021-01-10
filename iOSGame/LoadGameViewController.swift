import UIKit

class LoadGameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoadGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SaveStore.saveItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? LoadItemTableViewCell else {
            return UITableViewCell()
        }
        let item = SaveStore.saveItems[indexPath.row]
        cell.saveName.text = item.saveName
        cell.saveDate.text = item.saveDateString
        cell.character.image = item.characterImage
        return cell
    }
}
