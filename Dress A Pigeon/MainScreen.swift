import SwiftUI

struct MainScreen: View {

    @EnvironmentObject var characterSelection: CharacterSelection
    @State private var isAnimating = false

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

                        // 🎵 Stop previous & play background music
                        SoundManager.shared.stopSound(name: "Cute")
                        SoundManager.shared.playSound(name: "Cute", type: "mp3", loop: true)
                    }

                NavigationStack {
                    NavigationLink(destination: HatView().environmentObject(characterSelection)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                .fill(Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                .frame(width: 130, height: 50)

                            Image("Start")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100.0)
                        }
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        SoundManager.shared.playSound(name: "ui-button-click-8-341030", type: "mp3")
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
//=

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
