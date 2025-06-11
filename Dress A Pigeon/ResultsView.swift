import SwiftUI

struct ResultsView: View {
  @EnvironmentObject var characterSelection: CharacterSelection

  var body: some View {
    VStack {
      Text("Your Total Score:")
        .font(.largeTitle)
        .padding()

      Text("\(characterSelection.totalScore)")
        .font(.system(size: 100, weight: .bold))
        .foregroundColor(.blue)

      Text("Hat: \(characterSelection.hat)")
      Text("Bod: \(characterSelection.bod)")
      Text("Shoe: \(characterSelection.shoe)")

      Spacer()
      // Button to go back or reset
      Button("Start Over (Reset Values)") {
        characterSelection.hat = 0
        characterSelection.bod = 0
        characterSelection.shoe = 0
        characterSelection.activeIndex = nil
        // In a real app, you'd navigate back to the root here
        // For simplicity, just resetting the values in the environment object
      }
      .padding()
      .background(Color.red)
      .foregroundColor(.white)
      .cornerRadius(10)
    }
    .navigationTitle("Result")
  }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ResultsView()
                .environmentObject(CharacterSelection())
        }
    }
}
