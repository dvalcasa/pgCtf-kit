//
//  UpdateGliderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 13/11/2025.
//

import Foundation

public struct UpdateGliderRequest: Codable {
    public let brand: String?
    public let model: String?
    public let size: String?
    public let colorName: String?
    public let colors: [Int]?
    
    public init(brand: String? = nil,
                model: String? = nil,
                size: String? = nil,
                colorName: String? = nil,
                colors: [Int]? = nil) {
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}
