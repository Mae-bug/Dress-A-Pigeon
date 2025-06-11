//
//  MainScreen.swift
//  Dress A Pigeon
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var characterSelection: CharacterSelection // Add this line to access the environment object

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()

                NavigationStack {
                    NavigationLink(destination: HatView().environmentObject(characterSelection)) { // Pass it here
                        Text("Start")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
            }
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

#Preview() {
}
