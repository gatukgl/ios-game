import UIKit

class HomeViewController: UIViewController {
    var saveItem: SaveItem?

    @IBOutlet weak var savedMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        savedMessage.alpha = 0.0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard var item = saveItem else { return }

        let alert = UIAlertController(
            title: "Save Game",
            message: "Please enter save name",
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = "Save name..."
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            item.saveName = alert.textFields?[0].text ?? "Default save name"
            SaveStore.saveItems.append(item)
            UIView.animate(withDuration: 0.5) {
                self.savedMessage.alpha = 1.0
            }
        })

        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func onQuitButtonTabbed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
