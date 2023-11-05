//
//  LoginViewModel.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class LoginViewModel : ObservableObject
{
    private let dataAccess: LoginDataAccess
    @Published var loadedUser: User?
    
    public init()
    {
        self.dataAccess = LoginDataAccess()
        self.loadedUser = nil
    }
    
    public func Login(username: String, password: String)
    {
        Task.init
        {
            //we should probably have the view pass a user obj in but idc
            let user = await dataAccess.Login(user: User(userId: 0, name: username, passHash: password))
            if(!user.Success)
            {
                return
            }
            
            await MainActor.run
            {
                loadedUser = user.Data
            }
        }
        
    }
    
    public func CreateUser(username: String, password: String)
    {
        Task.init
        {
            //we should probably have the view pass a user obj in but idc
            let result = await dataAccess.CreateUser(user: User(userId: 0, name: username, passHash: password))
            
            if(!result.Success)
            {
                return
            }
            
            let user = await dataAccess.Login(user: User(userId: 0, name: username, passHash: password))
            if(!user.Success)
            {
                return
            }
            
            await MainActor.run
            {
                loadedUser = user.Data
            }
        }
    }
}
