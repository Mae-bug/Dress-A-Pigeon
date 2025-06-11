import SwiftUI

@main
struct YourApp: App {
    @StateObject var characterSelection = CharacterSelection() // Create the source of truth

    var body: some Scene {
        WindowGroup {
            NavigationStack { // The root NavigationStack
                MainScreen() // Your first view in the navigation flow
         
            }
            .environmentObject(characterSelection) // Make it available to all child views
        }
    }
}
