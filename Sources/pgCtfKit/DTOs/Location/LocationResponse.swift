//
//  LocationResponse.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

import Foundation

public struct LocationResponse: Decodable {
    let id: UUID?
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let timestamp: String
    let playerId: UUID
    
    init(id: UUID?,
         latitude: Double,
         longitude: Double,
         altitude: Double,
         timestamp: String,
         playerId: UUID) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.playerId = playerId
    }
}
