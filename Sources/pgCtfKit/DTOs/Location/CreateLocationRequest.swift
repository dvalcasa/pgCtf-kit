//
//  CreateLocationRequest.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

import Foundation

public struct CreateLocationRequest: Encodable {
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let timestamp: Date
    public let playerId: UUID
    
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
