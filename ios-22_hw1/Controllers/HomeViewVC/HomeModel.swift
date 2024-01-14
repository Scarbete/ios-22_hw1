import Foundation
import UIKit



class HomeModel {
    private let notes: [String] = ["Aesthetic", "Quasar", "Exweasy", "Ayaki", "Yardix", "Naarkz"]
    weak var controller: HomeController?
    
    init(controller: HomeController) {
        self.controller = controller
    }
    
    func getNotes() {
        controller?.backNotes(notes: notes)
    }
    
}
