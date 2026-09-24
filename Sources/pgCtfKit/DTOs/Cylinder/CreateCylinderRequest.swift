//
//  CreateCylinderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CreateCylinderRequest: Encodable {
    public let rank: Int
    public let latitude: Double
    public let longitude: Double
    public let radius: Double
    public let cylinderMapId: UUID
    public let colorRaw: Int
    
    public init(rank: Int,
                latitude: Double,
                longitude: Double,
                radius: Double,
                cylinderMapId: UUID,
                colorRaw: Int) {
        self.rank = rank
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
        self.cylinderMapId = cylinderMapId
        self.colorRaw = colorRaw
    }
}

