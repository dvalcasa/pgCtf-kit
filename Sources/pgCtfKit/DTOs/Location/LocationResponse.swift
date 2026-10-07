//
//  LocationResponse.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

import Foundation

public struct LocationResponse: Codable, Sendable {
    public let id: UUID?
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let timestamp: String
    public let playerID: UUID
    
    public init(id: UUID?,
                latitude: Double,
                longitude: Double,
                altitude: Double,
                timestamp: String,
                playerID: UUID) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.playerID = playerID
    }
}
