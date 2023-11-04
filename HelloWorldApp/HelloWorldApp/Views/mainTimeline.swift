//
//  ContentView.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct mainTimeline: View {
    var body: some View {
        VStack {
            HStack{
                
            }
            Spacer()
        }
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 1) {
                ForEach(0..<4) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 395, height: 700)
                        .background(.blue)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    mainTimeline()
}
