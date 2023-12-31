//
//  emojiPopup.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct emojiPopup: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.green
                    .ignoresSafeArea()
                    .brightness(0.15)
                VStack {
                    Group{
                    Text("Emoji Logo")
                        .font(.largeTitle)
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                    
                        NavigationLink { selfieView() }
                            label: {
                                Text("Continue")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 75)
                                    .background(Color.mint)
                                    .cornerRadius(75)
                                    .padding()
                            }
                        }
                    }
            }
        }
    }
}

