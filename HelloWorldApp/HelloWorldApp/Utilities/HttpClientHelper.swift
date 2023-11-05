//
//  HttpClientHelper.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public class HttpClientHelper
{
    public init(){}

    public func Get<T>(baseUrl: String, resource: String, queryParams: [URLQueryItem]? = nil) async -> Result<T?> where T : Decodable
    {
        var resource = URLComponents(string: baseUrl + resource)
        if(queryParams != nil) {
            resource!.queryItems = queryParams
        }

        var request = URLRequest(url: resource!.url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        var result : Result<T?> = Result<T?>(data: nil, success: false)
        
        do {
            let (data, _) = try await session.data(for: request)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            result = Result<T?>(data: decoded, success: true)
        } catch {
            print(error)
            
            if(error is Swift.DecodingError) {
                result = Result<T?>(data: nil, success: false, error: LoadingError.notFound)
            }
            else {
                result = Result<T?>(data: nil, success: false, error: LoadingError.internalError(message: error.localizedDescription))
            }
       }
        
        return result
    }
    
    public func Put<T>(baseUrl: String, resource: String, queryParams: [URLQueryItem]? = nil, decode: Bool? = true) async -> Result<T?> where T : Decodable
    {
        var resource = URLComponents(string: baseUrl + resource)
        if(queryParams != nil) {
            resource!.queryItems = queryParams
        }

        var request = URLRequest(url: resource!.url!)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        var result : Result<T?> = Result<T?>(data: nil, success: false)
        
        do {
            let (data, _) = try await session.data(for: request)
            if(decode ?? true)
            {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                result = Result<T?>(data: decoded, success: true)
                return result;
            }
            
            return Result<T?>(data: nil, success: true)
        } catch {
            print(error)
            
            if(error is Swift.DecodingError) {
                result = Result<T?>(data: nil, success: false, error: LoadingError.notFound)
            }
            else {
                result = Result<T?>(data: nil, success: false, error: LoadingError.internalError(message: error.localizedDescription))
            }
       }
        
        return result
    }
    
    public func Post<T>(baseUrl: String, resource: String, queryParams: [URLQueryItem]? = nil, decode: Bool? = true) async -> Result<T?> where T : Decodable
    {
        var resource = URLComponents(string: baseUrl + resource)
        if(queryParams != nil) {
            resource!.queryItems = queryParams
        }

        var request = URLRequest(url: resource!.url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        var result : Result<T?> = Result<T?>(data: nil, success: false)
        
        do {
            let (data, _) = try await session.data(for: request)
            if(decode ?? true)
            {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                result = Result<T?>(data: decoded, success: true)
                return result;
            }
            
            return Result<T?>(data: nil, success: true)
        } catch {
            print(error)
            
            if(error is Swift.DecodingError) {
                result = Result<T?>(data: nil, success: false, error: LoadingError.notFound)
            }
            else {
                result = Result<T?>(data: nil, success: false, error: LoadingError.internalError(message: error.localizedDescription))
            }
       }
        
        return result
    }
}
