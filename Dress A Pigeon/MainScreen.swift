//
//  MainScreen.swift
//  Dress A Pigeon
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI
struct MainScreen: View {
    var body: some View {
        ZStack { // Layer views on top of each other
            
           
            VStack {
                NavigationStack {
                    VStack(spacing: 40) {
                        Image("MainScreenBackground")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        Text("Welcome!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .shadow(radius: 10)
                            .padding()

                        NavigationLink(destination: HatView()) {
                            Text("Start")
                                .font(.title)
                                .foregroundColor(Color.purple)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
