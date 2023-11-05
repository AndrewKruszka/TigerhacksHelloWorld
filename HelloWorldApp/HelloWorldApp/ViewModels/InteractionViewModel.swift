//
//  InteractionViewModel.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class InteractionViewModel : ObservableObject
{
    @Published var userLocation: Coordinate
    @Published var loadedInteraction: Interaction?
    
    public var signedInUser: Int

    private let dataAccess: InteractionDataAccess
    private let locationManager = LocationManager()
    
    public init(userId: Int)
    {
        self.dataAccess = InteractionDataAccess()
        self.userLocation = Coordinate()
        self.loadedInteraction = nil
        self.signedInUser = userId
        
        locationManager.locationChangedAction = self.PositionChanged
        locationManager.failureAction = { error in
            //No real error handling in this view, need to find a way to display an error to the user
        }
    }
    
    func PositionChanged(coordinate: Coordinate) {
        userLocation = coordinate
        
        if(signedInUser == 0)
        {
            return;
        }
        
        Task.init {
            let result = await dataAccess.GetInteraction(coordinate: coordinate, userId: signedInUser)

            
            if(!result.Success)
            {
                return;
            }
            
            await MainActor.run
            {
                loadedInteraction = result.Data
            }
        }

    }
}
