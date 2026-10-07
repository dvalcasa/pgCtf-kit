//
//  CylinderResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 05/05/2025.
//

import Foundation

public struct CylinderResponse: Codable, Sendable {
    public let id: UUID?
    public let rank: Int
    public let longitude: Double
    public let latitude: Double
    public let radius: Double
    public let colorRaw: Int
    public let cylinderMapID: UUID?
    
    public init(id: UUID? = nil,
                rank: Int,
                longitude: Double,
                latitude: Double,
                radius: Double,
                colorRaw: Int,
                cylinderMapID: UUID? = nil) {
        self.id = id
        self.rank = rank
        self.longitude = longitude
        self.latitude = latitude
        self.radius = radius
        self.colorRaw = colorRaw
        self.cylinderMapID = cylinderMapID
    }
}

