import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var characterSelection: CharacterSelection
    
    @State private var finalPigeon: String = ""
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Text("\(characterSelection.totalScore)")
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.blue)
            
            Image(finalPigeon)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            
            NavigationLink(destination: MainScreen().environmentObject(characterSelection)) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                        .fill(Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                        .frame(width: 130, height: 50)
                   
                    
                    Text("Play Again")
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
        .onAppear {
            finalPigeon = String(characterSelection.totalScore)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    
    struct ResultsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                ResultsView()
                    .environmentObject(CharacterSelection())
            }
            
        }
    }
}

#Preview {
}
