import SwiftUI
import AVFoundation

struct MainScreen: View {
    @EnvironmentObject var characterSelection: CharacterSelection
    @State private var isAnimating = false
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                        prepareSound(soundName: "ui-button-click-8-341030", type: "mp3")
                    }

                NavigationStack {
                    NavigationLink(destination: HatView().environmentObject(characterSelection)) {
                        Text("Start")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        playSound()
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // MARK: - Sound setup
    func prepareSound(soundName: String, type: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
}

struct MainScreenPreviewWrapper: View {
    @StateObject var characterSelection = CharacterSelection()

    var body: some View {
        NavigationStack {
            MainScreen()
                .environmentObject(characterSelection)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenPreviewWrapper()
    }
}
