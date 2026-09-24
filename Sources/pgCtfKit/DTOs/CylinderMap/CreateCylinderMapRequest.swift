//
//  CreateCylinderMapRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CreateCylinderMapRequest: Codable {
    public let name: String
    public let description: String?
    public let imageData: Data?
    
    public init(name: String,
                description: String? = nil,
                imageData: Data? = nil) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
}
