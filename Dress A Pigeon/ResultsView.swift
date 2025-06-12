import SwiftUI
import AVFoundation

struct ResultsView: View {
    @EnvironmentObject var characterSelection: CharacterSelection
    
    @State private var finalPigeon: String = ""
    @State private var isAnimating = false
    @State private var audioPlayer1: AVAudioPlayer?
    @State private var audioPlayer2: AVAudioPlayer?
    
    var body: some View {
        ZStack{
            
            Image("background")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .ignoresSafeArea()
            
            VStack {
                
                Image("Congratulations")
                    .resizable()
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                    }
                
                
                
                Image(finalPigeon)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: MainScreen().environmentObject(characterSelection)) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                            .fill(Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                            .frame(width: 150, height: 50)
                        
                        
                        Image("PlayAgain")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150.0)
                        
                    }
                    .padding(50)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isAnimating = true
                        }
                        prepareSound(soundName: "ui-button-click-8-341030", type: "mp3")
                        prepareSound2(soundName: "yay-6326", type: "mp3")
                        playSound2()
                    }
                }
            }
            .simultaneousGesture(TapGesture().onEnded {
                playSound()
            })
            
            .onAppear {
                finalPigeon = String(characterSelection.totalScore)
            }
            .navigationBarBackButtonHidden(true)
            
        }
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

 

    
    
    struct ResultsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                ResultsView()
                    .environmentObject(CharacterSelection())
            
        
            }
            
        }
    }


#Preview {
}
