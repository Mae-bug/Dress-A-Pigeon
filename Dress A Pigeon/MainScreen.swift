//
//  MainScreen.swift
//  Dress A Pigeon
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
    ZStack {
        Image("background")
        
        VStack {
            Text("Welcome!")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            NavigationStack{
                NavigationLink(destination: HatView()) {
                    
                    Text("Start")
                        .padding()
                        .background(Color.white)
                    
                }//end of navigation link
            }//end of Navigation Stack
        }//end of VStack
         }//end of ZStack
     }//end of Body
}//end of struct

 #Preview {
    MainScreen()
}
