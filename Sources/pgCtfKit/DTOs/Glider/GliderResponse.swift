//
//  CGliderResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 20/01/2025.
//

import Foundation

struct GliderResponse: Codable {
    let id: UUID?
    let brand: String
    let model: String
    let size: String
    let colorName: String
    let colors: [Int]?
    
    init(id: UUID? = nil, brand: String, model: String, size: String, colorName: String, colors: [Int]? = nil) {
        self.id = id
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
