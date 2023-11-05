//
//  ContentView.swift
//  HelloWorldApp
//
//  Created by Andrew Kruszka on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @ObservedObject var landmarkViewModel: LandmarkViewModel
    @ObservedObject var interactionViewModel: InteractionViewModel
    @State private var position: Int?
    
    init() {
        position = 2
        loginViewModel = LoginViewModel()
        landmarkViewModel = LandmarkViewModel()
        interactionViewModel = InteractionViewModel(userId: 0)
    }

    var body: some View {
        if(loginViewModel.loadedUser != nil)
        {
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack(spacing: 10) {
                        emojiPopup().frame(width: 400, height: 750).id(1)
                        emojiPopup().frame(width: 400, height: 750).id(2)
                        emojiPopup().frame(width: 400, height: 750).id(3)
                        emojiPopup().frame(width: 400, height: 750).id(4)
                    }
                        .onAppear() {
                            position = 2
                        }
                }
            }
        }
        else
        {
            HStack
            {
                NavigationStack
                {
                    NavigationLink {
                        LoginView(viewModel: loginViewModel)
                    } label: {
                        Text("Login")
                            .bold()
                    }
                    NavigationLink {
                        CreateAccountView(viewModel: loginViewModel)
                    } label: {
                        Text("Create Account")
                            .bold()
                    }
                }
            }
        }
    }
}
