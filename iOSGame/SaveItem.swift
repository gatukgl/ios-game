import Foundation
import UIKit

enum Character {
    case swordsman
    case magician
    case undefined
}

struct SaveItem {
    var saveName: String = ""
    var saveDate: Date = Date()
    var strength: Float = 0.0
    var character: Character = .undefined
    var saveDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = .current
        return dateFormatter.string(for: self.saveDate) ?? ""
    }

    var characterImage: UIImage {
        let imageName = self.character == .swordsman ? "Swordsman" : "Magician"
        return UIImage(named: imageName) ?? UIImage()
    }
}

class SaveStore {
    // Singleton
    static let instance = SaveStore()
    private init() {}

    static var saveItems = [SaveItem]()
}
