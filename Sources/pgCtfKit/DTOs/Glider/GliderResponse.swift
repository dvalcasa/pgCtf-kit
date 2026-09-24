//
//  CGliderResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 20/01/2025.
//

import Foundation

public struct GliderResponse: Codable {
    public let id: UUID?
    public let brand: String
    public let model: String
    public let size: String
    public let colorName: String
    public let colors: [Int]?
    
    public init(id: UUID? = nil,
                brand: String,
                model: String,
                size: String,
                colorName: String,
                colors: [Int]? = nil) {
        self.id = id
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
