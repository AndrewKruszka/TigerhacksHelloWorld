//
//  ContentView.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var position: Int?
    
    init() {
        position = 2
    }

    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 10) {
                    emojiPopup().frame(width: 400, height: 750).id(1)
                    emojiPopup().frame(width: 400, height: 750).id(2)
                    emojiPopup().frame(width: 400, height: 750).id(3)
                    emojiPopup().frame(width: 400, height: 750).id(4)
                }.scrollTargetLayout()
                 .onAppear() {
                    position = 2
                }
            }.scrollPosition(id: $position)
        }.scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}
