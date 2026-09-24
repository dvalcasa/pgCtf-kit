//
//  UpadateCylinderMapRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 20/04/2026.
//

import Foundation

struct UpadateCylinderMapRequest: Codable {
    public let name: String?
    public let description: String?
    public let imageData: Data?
    
    public init(name: String? = nil,
                description: String? = nil,
                imageData: Data? = nil) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
}
