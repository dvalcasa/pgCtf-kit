//
//  UpadateCylinderMapRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 20/04/2026.
//

import Foundation

struct UpadateCylinderMapRequest: Codable {
    let name: String?
    let description: String?
    let imageData: Data?
    
    init(name: String? = nil, description: String? = nil, imageData: Data? = nil) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
}
