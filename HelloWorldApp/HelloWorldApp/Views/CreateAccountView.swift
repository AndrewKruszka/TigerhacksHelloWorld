//
//  LoginView.swift
//  th23
//
//  Created by Caleb Horsch on 11/4/23.
//

import SwiftUI

struct CreateAccountView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var displayPassword: Bool = false
    @ObservedObject var viewModel: LoginViewModel

    init(viewModel: LoginViewModel)
    {
        self.viewModel = viewModel
    }
    
    init()
    {
        self.viewModel = LoginViewModel()
    }
    
    func handleCreation() {
        if(email.isEmpty || password.isEmpty)
        {
            return;
        }
        
        viewModel.CreateUser(username: email, password: password)
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                
                Form {
                    Section(header: Text("Create Account").font(.title)) {
                        VStack {
                            TextField(
                                "Email",
                                text: $email,
                                prompt: Text("Email")).padding()
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .textFieldStyle(.roundedBorder)
                            
                            HStack {
                                if displayPassword {
                                    TextField(
                                        "Password",
                                        text: $password,
                                        prompt: Text("Password"))
                                    .padding()
                                    .disableAutocorrection(true)
                                } else {
                                    SecureField(
                                        "Password",
                                        text: $password,
                                        prompt: Text("Password"))
                                    .padding()
                                    .disableAutocorrection(true)
                                }
                                Button {
                                    displayPassword.toggle()
                                } label: {
                                    Image(systemName: displayPassword ? "eye.slash" : "eye")
                                }
                            }
                            .textFieldStyle(.roundedBorder)
                        }
                        Button("Create", action: handleCreation)
                    }
                }
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
