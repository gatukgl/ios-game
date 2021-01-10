import UIKit

class NewGameViewController: UIViewController {
    @IBOutlet weak var magicianLabel: UILabel!
    @IBOutlet weak var swordsmanLabel: UILabel!
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var slider: UISlider!

    var saveItem = SaveItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        playGameButton.isUserInteractionEnabled = false
    }

    @IBAction func onMagicianSelected(_ sender: Any) {
        choose(character: .magician)
    }

    @IBAction func onSwordmansSelected(_ sender: Any) {
        choose(character: .swordsman)
    }

    @IBAction func onStrengthChanged(_ sender: Any) {
        guard let slider = sender as? UISlider else { return }
        saveItem.strength = slider.value
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGameSegue" {
            guard let homeViewController = segue.destination as? HomeViewController else { return }

            saveItem.strength = slider.value
            saveItem.saveDate = Date()
            homeViewController.saveItem = saveItem
        }
    }

    //MARK: - Private methods
    private func choose(character: Character) {
        saveItem.character = character
        playGameButton.isUserInteractionEnabled = true
        playGameButton.setTitleColor(.systemBlue, for: .normal)

        switch character {
            case .magician:
                magicianLabel.textColor = .blue
                swordsmanLabel.textColor = .gray
            case .swordsman:
                swordsmanLabel.textColor = .blue
                magicianLabel.textColor = .gray
            default:
                return
        }
    }
}
