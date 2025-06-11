import SwiftUI

struct BodView: View {
    @EnvironmentObject var characterSelection: CharacterSelection

    let frameSize = 185.0

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                Text("Choose a Body Accessory")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue:0.594, saturation: 0.955, brightness: 0.445))
                    .padding(5)
                    .background(Color(hue: 0.752, saturation: 0.135, brightness: 0.967))
                    .cornerRadius(5)
             

                bodSelectionRow(indices: [0, 1])
                bodSelectionRow(indices: [2, 3])

                NavigationLink(destination: ShoeView().environmentObject(characterSelection)) {
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
                .disabled(characterSelection.bod == 0)
                .padding()

            }
            .padding()
        }
        .onAppear {
            characterSelection.activeIndex = nil
        }
    }

    @ViewBuilder
    func bodSelectionRow(indices: [Int]) -> some View {
        HStack(spacing: 20) {
            ForEach(indices, id: \.self) { index in
               let imageName = "\( (index + 1) * 10)"
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                        .fill(characterSelection.activeIndex == index
                              ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0)
                              : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                        .frame(width: frameSize, height: frameSize)

                    Image(imageName) // Swap with unique image per index if needed
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameSize)
                }
                .onTapGesture {
                    if characterSelection.activeIndex == index {
                        characterSelection.activeIndex = nil
                        characterSelection.bod = 0
                    } else {
                        characterSelection.activeIndex = index
                        characterSelection.bod = (index + 1) * 10
                    }
                    print("Bod selected: \(characterSelection.bod), Active Index: \(String(describing: characterSelection.activeIndex))")
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
}
    

// Wrapper for the preview with StateObject
struct BodViewPreviewWrapper: View {
    @StateObject var characterSelection = CharacterSelection()

    var body: some View {
        NavigationStack {
            BodView()
                .environmentObject(characterSelection)
        }
    }
}

struct BodView_Previews: PreviewProvider {
    static var previews: some View {
        BodViewPreviewWrapper()
    }
}
