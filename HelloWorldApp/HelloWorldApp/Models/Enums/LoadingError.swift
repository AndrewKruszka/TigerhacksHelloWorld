//
//  LoadingError.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

public enum LoadingError: Error, Equatable {
    case notFound
    case unauthorized
    case internalError(message: String)
}
