import SwiftUI

struct ShoeView: View {
  @EnvironmentObject var characterSelection: CharacterSelection

  let frameSize = 185.0

  var body: some View {
    ZStack {
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()

      VStack {
        Text("Choose a Shoe")
          .font(.title)
          .fontWeight(.heavy)
          .foregroundColor(Color(hue: 0.594, saturation: 0.955, brightness: 0.445))
          .padding(5)
          .background(Color.white)
          .cornerRadius(5)

        shoeSelectionRow(indices: [0, 1])
        shoeSelectionRow(indices: [2])

        NavigationLink(destination: ResultsView().environmentObject(characterSelection)) {
          ZStack {
            RoundedRectangle(cornerRadius: 30)
              .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
              .fill(Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
              .frame(width: 130, height: 50)

            Text("Continue")
              .font(.headline)
              .fontWeight(.semibold)
              .foregroundColor(.white)
          }
        }
        .disabled(characterSelection.shoe == 0)
        .padding()
      }
      .padding()
    }
    .onAppear {
      characterSelection.activeIndex = nil
    }
  }

  @ViewBuilder
  func shoeSelectionRow(indices: [Int]) -> some View {
    HStack(spacing: 20) {
      ForEach(indices, id: \.self) { index in
        let imageName = "\( (index + 1) * 1)"

        ZStack {
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
            .fill(characterSelection.activeIndex == index
               ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0)
               : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
            .frame(width: frameSize, height: frameSize)

          Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: frameSize)
        }
        .onTapGesture {
          if characterSelection.activeIndex == index {
            characterSelection.activeIndex = nil
            characterSelection.shoe = 0
          } else {
            characterSelection.activeIndex = index
            characterSelection.shoe = (index + 1) * 1
          }
          print("Shoe selected: \(characterSelection.shoe), Active Index: \(String(describing: characterSelection.activeIndex))")
        }
      }
    }
    .padding()
    .navigationBarBackButtonHidden(true)
  }
}

struct ShoeViewPreviewWrapper: View {
  @StateObject var characterSelection = CharacterSelection()

  var body: some View {
    NavigationStack {
      ShoeView()
        .environmentObject(characterSelection)
    }

  }
}

struct ShoeView_Previews: PreviewProvider {
  static var previews: some View {
    ShoeViewPreviewWrapper()
  }
}
