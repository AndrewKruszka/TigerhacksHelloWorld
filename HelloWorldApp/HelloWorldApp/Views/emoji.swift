//
//  emoji.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct emoji: View {
    var body: some View {
        Color.green
            .ignoresSafeArea()
            .brightness(0.15)
            .overlay(
                VStack {
                    Group{
                        Text("Emoji Image Here")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            
                        Button(action: {
                            print("tapped!")
                        }, label: {
                            Text("Selfie!")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 150)
                                .background(Color.green)
                                .cornerRadius(70)
                                .padding()
                        })
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                })
    }

}
#Preview {
    emoji()
}
