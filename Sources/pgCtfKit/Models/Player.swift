//
//  Player.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 08/03/2024.
//

import Foundation

public struct Player: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let name: String
    public let user: User
    public let teamId: UUID?
    public let locations: [Location]
    
    public var longitude: Double? {
        if let lastLocation = locations.last {
            return lastLocation.longitude
        } else {
            return nil
        }
    }
    
    public var latitude: Double? {
        if let lastLocation = locations.last {
            return lastLocation.latitude
        } else {
            return nil
        }
    }
    
    public var altitude: Double? {
        if let lastLocation = locations.last {
            return lastLocation.altitude
        } else {
            return nil
        }
    }
    
    init(id: UUID? = nil,
         name: String,
         user: User,
         teamId: UUID? = nil,
         locations: [Location] = []) {
        self.id = id
        self.name = name
        self.user = user
        self.teamId = teamId
        self.locations = locations
    }
}
