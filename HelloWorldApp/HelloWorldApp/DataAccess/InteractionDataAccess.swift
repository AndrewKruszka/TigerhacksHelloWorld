//
//  InteractionDataAccess.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class InteractionDataAccess
{
    public func GetInteraction(coordinate: Coordinate, userId: Int) async -> Result<Interaction?> {
        let params = [
            URLQueryItem(name:"latitude", value: String(coordinate.Latitude)),
            URLQueryItem(name:"longitude", value: String(coordinate.Longitude)),
            URLQueryItem(name:"userId", value: String(userId))
        ]
        
        var result : Result<Interaction?> = await HttpClientHelper().Get(baseUrl: "http://ec2-3-15-13-153.us-east-2.compute.amazonaws.com:32771/", resource: "Landmark")
                
        if(result.Error == LoadingError.notFound)
        {
            result = Result<Interaction?>(data: nil, success: true, error: nil)
        }
        
        return result
    }
}
