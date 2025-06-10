//
//  ContentView.swift
//  Dress A Pigeon
//
//  Created by Scholar on 6/9/25.
//


import SwiftUI

struct HatView: View {

    
    var frameSize = 185.0
    @State private var hat = 0
    @State private var bod = 0
    @State private var foot = 0
    @State private var activeIndex: Int? = nil

    var body: some View {
        NavigationStack{
            ZStack{
                Image("background")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Text("Choose a Hat")
    
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 0.594, saturation: 0.955, brightness: 0.445))
                        .background(Color.white)
                    HStack(spacing: 20) {
                        ForEach(0..<1) { index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                    .fill(activeIndex == index ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0) : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                    .frame(width: frameSize, height: frameSize)
                                
                                Image("bluegreycat")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frameSize)
                                    .onTapGesture {
                                        hat = 100
                                        print(hat)
                                        if activeIndex == index {
                                            // Tapping again deactivates it
                                            activeIndex = nil
                                        } else {
                                            activeIndex = index
                                        }
                                    }
                            }
                            
                            
                        }
                        ForEach(1..<2) { index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                    .fill(activeIndex == index ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0) : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                    .frame(width: frameSize, height: frameSize)
                                
                                Image("bluegreycat")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frameSize)
                                    .onTapGesture {
                                        hat = 200
                                        print(hat)
                                        if activeIndex == index {
                                            // Tapping again deactivates it
                                            activeIndex = nil
                                        } else {
                                            activeIndex = index
                                        }
                                    }
                            }
                            
                            
                        }
                    }
                    .padding()
                    HStack(spacing: 20) {
                        ForEach(2..<3) { index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                    .fill(activeIndex == index ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0) : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                    .frame(width: frameSize, height: frameSize)
                                
                                Image("bluegreycat")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frameSize)
                                    .onTapGesture {
                                        hat = 300
                                        print(hat)
                                        if activeIndex == index {
                                            // Tapping again deactivates it
                                            activeIndex = nil
                                        } else {
                                            activeIndex = index
                                        }
                                    }
                            }
                        }
                        ForEach(3..<4) { index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                    .fill(activeIndex == index ? Color(hue: 0.758, saturation: 0.164, brightness: 1.0) : Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                    .frame(width: frameSize, height: frameSize)
                                
                                Image("bluegreycat")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frameSize)
                                    .onTapGesture {
                                        hat = 400
                                        print(hat)
                                        if activeIndex == index {
                                            // Tapping again deactivates it
                                            activeIndex = nil
                                        } else {
                                            activeIndex = index
                                        }
                                    }
                            }
                            
                            
                        }
                    }
                    NavigationLink(destination:BodView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(hue: 0.758, saturation: 0.164, brightness: 1.0), lineWidth: 14)
                                .fill(Color(hue: 0.758, saturation: 0.462, brightness: 0.992))
                                .frame(width: 130, height: 50)
                            
                            
                            Text("Continue")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HatView()
}
