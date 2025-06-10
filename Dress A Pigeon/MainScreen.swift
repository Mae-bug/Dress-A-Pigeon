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
        Image("Background2")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
        
        VStack {
           
            
            NavigationStack{
                NavigationLink(destination: HatView()) {
                    
                    Text("Start")
                       
                    
                }//end of navigation link
            }//end of Navigation Stack
        }//end of VStack
         }//end of ZStack
     }//end of Body
}//end of struct

 #Preview {
    MainScreen()
}
