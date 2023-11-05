//
//  Image.swift
//  th23
//
//  Created by Caleb Horsch on 11/4/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct imageInfo: Codable, Identifiable {
    var id: Int
    var city: String
    var state: String
    private var user: String
    var favorited: Bool
    var waved: Bool
    var waves: Int
    
    private var coordinates: Coordinates
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

func toImage(base64String: String) -> Image {
    let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)
    let convertedImage = UIImage(data: imageData!)
    let swiftImage = Image(uiImage: convertedImage!)
    return swiftImage
}

extension UIImage {
    func toBase64() -> String? {
        return self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
