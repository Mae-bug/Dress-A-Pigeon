import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var characterSelection: CharacterSelection // Add this line to access the environment object
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
                    }

                NavigationStack {
                    NavigationLink(destination: HatView().environmentObject(characterSelection)) { // Pass it here
                        Text("Start")
                            .font(.title3)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
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
