//
//  Landmark.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class Landmark: Decodable
{
    init(landmarkId: Int, coordinate: Coordinate, displayName: String)
    {
        LandmarkId = landmarkId
        Coordinate = coordinate
        DisplayName = displayName
    }
    
    public var LandmarkId: Int
    public var Coordinate: Coordinate
    public var DisplayName: String
    
    public enum CodingKeys: String, CodingKey {
        case LandmarkId
        case Coordinate
        case DisplayName
    }
    
    func asAnnotationItem() -> AnnotationItem
    {
        return AnnotationItem(coordinate: Coordinate, title: DisplayName)
    }
}
