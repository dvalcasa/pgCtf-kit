//
//  CreateCylinderMapRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CreateCylinderMapRequest: Codable {
    let name: String
    let description: String?
    let imageData: Data?
    
    init(name: String, description: String? = nil, imageData: Data? = nil) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
}
