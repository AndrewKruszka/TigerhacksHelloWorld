//
//  scrapbook.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct scrapbook: View {
    var body: some View {
        ScrollView {
            LazyHStack {
                PageView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        scrapbook()
    }
}

struct PageView: View {
    var body: some View {
        TabView {
            ForEach(0..<10) { i in
                ZStack {
                    Image("background")
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    scrapbook()
}
