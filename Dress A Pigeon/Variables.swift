import Foundation

class CharacterSelection: ObservableObject {
    @Published var hat: Int = 0
    @Published var bod: Int = 0
    @Published var foot: Int = 0
    @Published var pigeonNum: Int = 0
    @Published var activeIndex: Int? = nil // This tracks selection for the current view
}
