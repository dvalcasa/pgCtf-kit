//
//  LocationResponse.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

import Foundation

public struct LocationResponse: Decodable {
    public let id: UUID?
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let timestamp: String
    public let playerId: UUID
    
    public init(id: UUID?,
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
