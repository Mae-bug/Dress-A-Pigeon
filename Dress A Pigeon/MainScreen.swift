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
                
                Image ("MainScreenBackground")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
        
           
                VStack(spacing: 40) {
                    
                 
                    
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .shadow(radius: 10)
                    
                NavigationLink(destination: HatView()) {
                    
                  
                    Text("Start         ")
                        .font(.title)
                        .foregroundColor(Color.purple)
                        .padding()
                    .background(Color.white)
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
