//
//  CreateGliderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 13/11/2025.
//

import Foundation

public struct CreateGliderRequest: Codable {
    public let brand: String
    public let model: String
    public let size: String
    public let colorName: String
    public let colors: [Int]?
    
    public init(brand: String,
                model: String,
                size: String,
                colorName: String,
                colors: [Int]? = nil) {
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
