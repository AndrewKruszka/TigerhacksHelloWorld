//
//  Image.swift
//  th23
//
//  Created by Caleb Horsch on 11/4/23.
//

import Foundation
import SwiftUI

/*
extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
 */

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

let catImg = UIImage(named: "coolcat.jpeg")
let imageData = catImg?.jpegData(compressionQuality: 1)
let imageString = imageData?.description.toBase64()
