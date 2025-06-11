import SwiftUI
import AVFoundation

struct ShoeView: View {
    @EnvironmentObject var characterSelection: CharacterSelection
    @State private var isAnimating = false
    @State private var audioPlayer1: AVAudioPlayer?
    @State private var audioPlayer2: AVAudioPlayer?


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
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    playSound2()
                })
                .disabled(characterSelection.shoe == 0)
                .padding()

            }
            .padding()
            .onAppear {
                characterSelection.activeIndex = nil
                prepareSound(soundName: "button-click-289742", type: "mp3")
                prepareSound2(soundName: "ui-button-click-8-341030", type: "mp3")
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }

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
              .foregroundColor(Color(hue:0.594, saturation: 0.955, brightness: 0.445))
              .padding(5)
              .background(Color(hue: 0.752, saturation: 0.135, brightness: 0.967))
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
          .scaleEffect(isAnimating ? 1.1 : 1.0)
          .onAppear {
              withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                  isAnimating = true
              }
          }
        }
    }

    @ViewBuilder
    func shoeSelectionRow(indices: [Int]) -> some View {
        HStack(spacing: 20) {
            ForEach(indices, id: \.self) { index in
                let imageName = "\( (index + 1) *  1)"  // "100", "200", "300", "400"

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
                    playSound()
                    print("Shoe selected: \(characterSelection.shoe), Active Index: \(String(describing: characterSelection.activeIndex))")
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }

    func prepareSound(soundName: String, type: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer1?.prepareToPlay()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }

    func prepareSound2(soundName: String, type: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            do {
                audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer2?.prepareToPlay()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }

    func playSound() {
        audioPlayer1?.play()
    }

    func playSound2() {
        audioPlayer2?.play()
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
