//
//  LandmarkDataAccess.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class LandmarkDataAccess
{
    public func GetLandmarks() async -> Result<[Landmark]?> {
        var result : Result<[Landmark]?> = await HttpClientHelper().Get(baseUrl: "http://ec2-3-15-13-153.us-east-2.compute.amazonaws.com:32771/", resource: "Landmark")
        
        
        if(result.Error == LoadingError.notFound)
        {
            result = Result<[Landmark]?>(data: nil, success: true, error: nil)
        }
        
        return result
    }
}
