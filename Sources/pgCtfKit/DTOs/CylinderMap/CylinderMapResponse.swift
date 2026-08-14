//
//  CylinderMapResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

struct CylinderMapResponse: Codable {
    let id: UUID?
    let name: String
    let description: String?
    let imageData: Data?
    
    init(id: UUID?, name: String, description: String? = nil, imageData: Data? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
    }
    
    func toModel() -> CylinderMap {
        CylinderMap(
            id: id,
            name: name,
            description: description,
            imageData: imageData
        )
    }
}
