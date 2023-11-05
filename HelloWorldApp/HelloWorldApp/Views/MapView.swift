//
//  MapView.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/5/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapView : View {
    @ObservedObject var userLocation: Coordinate
    @State private var region: MKCoordinateRegion
    @State private var annotations: [AnnotationItem]?
    
    init(userLocation: Coordinate, annotations: [AnnotationItem]? = nil) {
        self.userLocation = userLocation
        self.annotations = annotations
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.Latitude, longitude: userLocation.Longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
        
    var body: some View {
        ZStack {
            NavigationStack()
            {
                Map(coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow),
                    annotationItems: annotations ?? []) { item in
                        MapAnnotation(coordinate: item.Coordinate)
                        {
                            NavigationLink {
                                LocationTimeline()
                            } label: {
                                Circle().strokeBorder(.red, lineWidth: 4)
                                    .frame(width: 40, height: 40)
                                Text("Create Account")
                                    .bold()
                            }
                        }
                    }
            }
        }
    }
}
