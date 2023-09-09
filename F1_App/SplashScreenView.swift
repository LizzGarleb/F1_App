//
//  SplashScreen.swift
//  F1_App
//  This is the loading screen.
//  Created by Lizbeth Garcia on 9/5/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var carOffset: CGFloat = -1000
    @State private var textOpacity: Double = 0.0
    
    var body: some View {
        if isActive {
            DriverListView()
        } else {
            // Background Color
            ZStack{
                Color(red: 0.2784313725490196, green: 0.7803921568627451, blue: 0.9882352941176471).ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("carSize")
                            .resizable()
                            .frame(width: 200, height: 70)
                            .offset(x: carOffset)
                        
                        Text("F1 Legacy")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .opacity(textOpacity)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            carOffset = 0 // Animate car from left to center
                            textOpacity = 1.0 // Animate text opacity
                        }
                        
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
