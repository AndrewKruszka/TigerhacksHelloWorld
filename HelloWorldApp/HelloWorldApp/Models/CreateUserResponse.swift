//
//  CreateUserResponse.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/5/23.
//

import Foundation

public class CreateUserResponse : Decodable
{
    public let ErrorMessage: String?
    public let IsSuccessful : Bool
    public let ErrorId : Int
    
    public init() {
        self.ErrorMessage = ""
        self.IsSuccessful = false
        self.ErrorId = 0
    }
    
    public enum CodingKeys: String, CodingKey {
        case ErrorMessage
        case IsSuccessful
        case ErrorId
    }
}
