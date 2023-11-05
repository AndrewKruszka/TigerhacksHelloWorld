//
//  Landmark.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class Landmark: Decodable
{
    init(landmarkId: Int, geoHash: String, displayName: String)
    {
        LandmarkId = landmarkId
        GeoHash = geoHash
        DisplayName = displayName
    }
    
    public var LandmarkId: Int
    public var GeoHash: String
    public var DisplayName: String
    
    public enum CodingKeys: String, CodingKey {
        case LandmarkId
        case GeoHash
        case DisplayName
    }
}
