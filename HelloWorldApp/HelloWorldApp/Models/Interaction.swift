//
//  Interaction.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class Interaction: Decodable
{
    init(id: Int, interactedOn: String, primaryUserId: Int, interactedWithUserId: Int, interactedAtHash: String)
    {
        Id = id
        InteractedOn = interactedOn
        PrimaryUserId = primaryUserId
        InteractedWithUserId = interactedWithUserId
        InteractedAtHash = interactedAtHash
    }
    
    public var Id: Int
    public var InteractedOn: String
    public var PrimaryUserId: Int
    public var InteractedWithUserId: Int
    public var InteractedAtHash: String

    public enum CodingKeys: String, CodingKey {
        case Id
        case InteractedOn
        case PrimaryUserId
        case InteractedWithUserId
        case InteractedAtHash
    }
}
