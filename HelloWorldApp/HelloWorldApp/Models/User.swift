//
//  User.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class User : Decodable
{
    init(userId: Int, name: String, passHash: String)
    {
        UserId = userId
        Name = name
        PassHash = passHash
    }
    
    public var UserId: Int
    public var Name: String
    public var PassHash: String
    
    public enum CodingKeys: String, CodingKey {
        case UserId
        case Name
        case PassHash
    }
}
