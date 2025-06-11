import SwiftUI
import AVFoundation

struct HatView: View {
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
                Text("Choose a Hat")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue: 0.594, saturation: 0.955, brightness: 0.445))
                    .padding(5)
                    .background(Color.white)
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
                        prepareSound(soundName: "button-click-289742", type: "mp3")
                        prepareSound2(soundName: "ui-button-click-8-341030", type: "mp3")
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    playSound2()
                })
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
                    playSound()
                    print("Hat selected: \(characterSelection.hat), Active Index: \(String(describing: characterSelection.activeIndex))")
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
