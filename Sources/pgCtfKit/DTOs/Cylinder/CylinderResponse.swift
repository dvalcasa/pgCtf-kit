//
//  CylinderResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 05/05/2025.
//

import Foundation

public struct CylinderResponse: Codable {
    let id: UUID?
    let rank: Int
    var longitude: Double
    var latitude: Double
    var radius: Double
    var cylinderMapId: UUID
    
    init(id: UUID? = nil,
        rank: Int,
        longitude: Double,
        latitude: Double,
        radius: Double,
        cylinderMapId: UUID) {
        self.id = id
        self.rank = rank
        self.longitude = longitude
        self.latitude = latitude
        self.radius = radius
        self.cylinderMapId = cylinderMapId
    }
}
