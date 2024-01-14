import Foundation
import UIKit



class HomeController {
    weak var view: HomeViewVC?
    var model: HomeModel?
    
    init(view: HomeViewVC) {
        self.view = view
        self.model = HomeModel(controller: self)
    }
    
    func getNotes() {
        model?.getNotes()
    }
    
    func backNotes(notes: [String]) {
        view?.succesNotes(notes: notes)
    }
    
}
