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
            .aspectRatio(contentMode: .fit)
        
  

        NavigationStack{
            NavigationLink(destination: HatView()) {
                Text("Start")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
                }//end of navigation link
            }//end of Navigation Stack
         }//end of ZStack
     }//end of Body
}//end of struct

 #Preview {
    MainScreen()
}
