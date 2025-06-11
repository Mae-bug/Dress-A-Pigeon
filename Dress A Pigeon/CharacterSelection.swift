import Foundation
import SwiftUI

class CharacterSelection: ObservableObject {
    @Published var hat: Int = 0
    @Published var bod: Int = 0
    @Published var shoe: Int = 0
    @Published var activeIndex: Int? = nil // To track selection within the current view
   

    var totalScore: Int {
        hat + bod + shoe
    }
}
