//
//  selfieCamera.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct selfieView: View {
    
    var body: some View {
        HostedViewController()
            .ignoresSafeArea()
        
        Button {
            //model.camera.takePhoto()
        } label: {
            Label {
                //Text("Take Photo")
            } icon: {
                ZStack {
                    Circle()
                        .strokeBorder(.blue, lineWidth: 3)
                        .frame(width: 62, height: 62)
                    Circle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}
    
#Preview {
    selfieView()
}
