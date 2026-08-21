//
//  UpdateGliderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 13/11/2025.
//

import Foundation

public struct UpdateGliderRequest: Codable {
    var brand: String?
    var model: String?
    var size: String?
    var colorName: String?
    var colors: [Int]?
    
    init(brand: String? = nil, model: String? = nil, size: String? = nil, colorName: String? = nil, colors: [Int]? = nil) {
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
