//
//  CylinderMapResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CylinderMapResponse: Decodable {
    public let id: UUID?
    public let name: String
    public let description: String?
    public let imageData: Data?
    
    public init(id: UUID?,
                name: String,
                description: String? = nil,
                imageData: Data? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
    }
    
    public func toModel() -> CylinderMap {
        CylinderMap(
            id: id,
            name: name,
            description: description,
            imageData: imageData
        )
    }
}
