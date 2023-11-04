//
//  ContentView.swift
//  CityAssistant
//
//  Created by Jules Maslak on 6/19/23.
//

import Foundation
import SwiftUI
import RealityKit

struct ContentView : View {
    
    @State private var favoriteColor = 0
    init() {
        
    }
    var body: some View {
        VStack {
            HStack {
                Image("gearshape").padding()
            }
            Picker("What is your favorite color?", selection: $favoriteColor) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)
            
            
            ZStack{
                VStack(alignment: .trailing) {
                    NavigationStack {
                        NavigationLink {
                            CrimeView()
                        } label: {
                            Label("2D", systemImage: "map")
                        }
                        NavigationLink {
                            CityTourViewWrapper()
                        } label: {
                            Label("City Tour", systemImage: "camera")
                        }
                        NavigationLink {
                            AboutView()
                        } label: {
                            Label("About this app", systemImage: "info")
                        }
                    }
                }
            }
        }
    }
    
    struct Content_Previews : PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
