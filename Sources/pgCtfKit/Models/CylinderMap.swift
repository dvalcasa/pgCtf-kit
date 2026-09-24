//
//  CylinderMap.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 04/02/2025.
//

import Foundation

public struct CylinderMap {
    public let id: UUID?
    public var name: String
    public let description: String?
    public var imageData: Data?
    public var cylinders: [Cylinder]
    
    public init(id: UUID? = nil,
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
