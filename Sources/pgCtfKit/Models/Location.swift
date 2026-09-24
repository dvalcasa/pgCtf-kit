//
//  Location.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 11/02/2025.
//

import Foundation

public struct Location: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let longitude: Double
    public let latitude: Double
    public let altitude: Double
    public let timestamp: Date
    public let playerId: UUID
    
    public init(id: UUID? = nil,
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
