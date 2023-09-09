//
//  ContentView.swift
//  F1_App
//
//  Created by Lizbeth Garcia on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(red: 0.2784313725490196, green: 0.7803921568627451, blue: 0.9882352941176471).ignoresSafeArea()
            VStack {
                Image("carSize")
                    .resizable()
                    .frame(width: 200, height: 70)
                Text("F1 Legacy")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            }
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
