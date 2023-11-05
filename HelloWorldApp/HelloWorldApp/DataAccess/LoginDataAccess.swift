//
//  LoginDataAccess.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class LoginDataAccess
{
    public func Login(user: User) async -> Result<User?> {
        let params = [
            URLQueryItem(name:"username", value: String(user.Name)),
            URLQueryItem(name:"password", value: String(user.PassHash))
        ]
        
        var result : Result<User?> = await HttpClientHelper().Get(baseUrl: "http://ec2-3-15-13-153.us-east-2.compute.amazonaws.com:32771/", resource: "User/Login", queryParams: params)
        
        if(result.Error == LoadingError.notFound)
        {
            result = Result<User?>(data: nil, success: true, error: nil)
        }
        
        return result
    }
    
    public func CreateUser(user: User) async -> Result<CreateUserResponse?> {
        let params = [
            URLQueryItem(name:"username", value: String(user.Name)),
            URLQueryItem(name:"password", value: String(user.PassHash))
        ]
        
        var result : Result<CreateUserResponse?> = await HttpClientHelper().Post(baseUrl: "http://ec2-3-15-13-153.us-east-2.compute.amazonaws.com:32771/", resource: "User", queryParams: params)
                
        if(result.Error == LoadingError.notFound)
        {
            result = Result<CreateUserResponse?>(data: nil, success: true, error: nil)
        }
        
        return result
    }
}
