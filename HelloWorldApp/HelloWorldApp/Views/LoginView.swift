//
//  LoginView.swift
//  th23
//
//  Created by Caleb Horsch on 11/4/23.
//

import SwiftUI

struct LoginView: View {
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
    
    func handleLogin() {
        if(email.isEmpty || password.isEmpty)
        {
            return;
        }
        
        viewModel.Login(username: email, password: password)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Login").font(.title)) {
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
                Button("Sign In", action: handleLogin)
                //Button("Register", action: handleRegister)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
