//
//  LoadingState.swift
//  HelloWorldApp
//
//  Created by Jules Maslak on 11/4/23.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
    case ignored //for when you want to kick off loading at a time after initialization of vm
}
