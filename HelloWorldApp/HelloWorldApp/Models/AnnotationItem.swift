//
//  AnnotationItem.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/5/23.
//

import Foundation
import MapKit

public class AnnotationItem : Identifiable {
    public let id = UUID()
    public var Coordinate: CLLocationCoordinate2D
    public var Title: String
    
    init(coordinate: Coordinate, title: String) {
        self.Coordinate = coordinate.AsCLLocationCoordinate()
        self.Title = title
    }
}
