import SwiftUI
import AVFoundation

struct BodView: View {
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
                    playSound()
                    print("Bod selected: \(characterSelection.bod), Active Index: \(String(describing: characterSelection.activeIndex))")
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
}
