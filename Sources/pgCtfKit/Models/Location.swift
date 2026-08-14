//
//  Location.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 11/02/2025.
//

import Foundation

struct Location: Identifiable, Hashable, Codable {
    let id: UUID?
    let longitude: Double
    let latitude: Double
    let altitude: Double
    let timestamp: Date
    let playerId: UUID
    
    init(id: UUID? = nil,
         longitude: Double,
         latitude: Double,
         altitude: Double,
         timestamp: Date,
         playerId: UUID) {
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.playerId = playerId
    }
}
