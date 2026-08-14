//
//  CylinderMap.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 04/02/2025.
//

import Foundation

struct CylinderMap: Identifiable, Codable, Hashable {
    let id: UUID?
    var name: String
    let description: String?
    var imageData: Data?
    var cylinders: [Cylinder]
    
    init(id: UUID? = nil,
         name: String,
         description: String? = nil,
         imageData: Data? = nil,
         cylinders: [Cylinder] = []) {
        self.id = id
        self.name = name
        self.description = nil
        self.imageData = imageData
        self.cylinders = cylinders
    }
}
