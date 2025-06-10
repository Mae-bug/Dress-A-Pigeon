//
//  MainScreen.swift
//  Dress A Pigeon
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        
        VStack {
           
            
            NavigationStack{
                
                ZStack {
                    Image("MainScreenBackground")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                NavigationLink(destination: HatView()) {
                    
                    Text("Start")
                        .font(.title)
                        .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                    
                }//end of navigation link
            }//end of Navigation Stack
        }//end of VStack
         }//end of ZStack
     }//end of Body
}//end of struct

 #Preview {
    MainScreen()
}
