//
//  CreateLocationRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/08/2026.
//

import Foundation

public struct CreateLocationRequest: Encodable, Sendable {
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let timestamp: Date
    let playerId: UUID
    
    public init(latitude: Double,
         longitude: Double,
         altitude: Double,
         timestamp: Date,
         playerId: UUID) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.playerId = playerId
    }
}
