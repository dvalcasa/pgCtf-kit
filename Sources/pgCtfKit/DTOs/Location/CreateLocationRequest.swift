//
//  CreateLocationRequest.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

import Foundation

public struct CreateLocationRequest: Codable, Sendable {
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let timestamp: Date
    public let playerID: UUID
    
    public init(latitude: Double,
                longitude: Double,
                altitude: Double,
                timestamp: Date,
                playerID: UUID) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.playerID = playerID
    }
}
