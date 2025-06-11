import SwiftUI

struct HatView: View {
    @EnvironmentObject var characterSelection: CharacterSelection
    @State private var isAnimating = false

    let frameSize = 185.0

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                Text("Choose a Hat")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue:0.594, saturation: 0.955, brightness: 0.445))
                    .padding(5)
                    .background(Color(hue: 0.752, saturation: 0.135, brightness: 0.967))
                    .cornerRadius(5)
             


                hatSelectionRow(indices: [0, 1])
                hatSelectionRow(indices: [2, 3])

                NavigationLink(destination: BodView().environmentObject(characterSelection)) {
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
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                    }
                }
                .disabled(characterSelection.hat == 0)
                .padding()

            }
            .padding()
        }
        .onAppear {
            characterSelection.activeIndex = nil
        }
    }

    @ViewBuilder
    func hatSelectionRow(indices: [Int]) -> some View {
        HStack(spacing: 20) {
            ForEach(indices, id: \.self) { index in
                let imageName = "\( (index + 1) * 100 )"  // "100", "200", "300", "400"
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                        .fill(characterSelection.activeIndex == index
                              ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0)
                              : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                        .frame(width: frameSize, height: frameSize)

                    Image(imageName) // Use different image for each index
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: frameSize)
                }
                .onTapGesture {
                    if characterSelection.activeIndex == index {
                        characterSelection.activeIndex = nil
                        characterSelection.hat = 0
                    } else {
                        characterSelection.activeIndex = index
                        characterSelection.hat = (index + 1) * 100
                    }
                    print("Hat selected: \(characterSelection.hat), Active Index: \(String(describing: characterSelection.activeIndex))")
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }

    }

struct HatViewPreviewWrapper: View {
    @StateObject var characterSelection = CharacterSelection()

    var body: some View {
        NavigationStack {
            HatView()
                .environmentObject(characterSelection)
        }
        
    }
    
}

struct HatView_Previews: PreviewProvider {
    static var previews: some View {
        HatViewPreviewWrapper()
    }
}
