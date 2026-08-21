//
//  CreateGliderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 13/11/2025.
//

import Foundation

public struct CreateGliderRequest: Codable {
    var brand: String
    var model: String
    var size: String
    var colorName: String
    var colors: [Int]?
    
    init(brand: String, model: String, size: String, colorName: String, colors: [Int]? = nil) {
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
