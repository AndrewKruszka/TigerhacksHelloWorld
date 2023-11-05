//
//  LandmarkViewModel.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class LandmarkViewModel : ObservableObject
{
    @Published var userLocation: Coordinate
    @Published var loadedLandmarks: [Landmark]
    
    private let dataAccess: LandmarkDataAccess
    private let locationManager = LocationManager()

    public init()
    {
        self.dataAccess = LandmarkDataAccess()
        self.userLocation = Coordinate()
        self.loadedLandmarks = []
        
        locationManager.locationChangedAction = self.PositionChanged
        locationManager.failureAction = { error in
            //No real error handling in this view, need to find a way to display an error to the user
        }
    }
    
    func PositionChanged(coordinate: Coordinate) {
        userLocation = coordinate
    }
}
