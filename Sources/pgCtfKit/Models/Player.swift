//
//  Player.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 08/03/2024.
//

import Foundation

struct Player: Identifiable, Codable, Sendable, Hashable {
    let id: UUID?
    let name: String
    let user: User
    let teamId: UUID?
    let locations: [Location]
    
    var longitude: Double? {
        if let lastLocation = locations.last {
            return lastLocation.longitude
        } else {
            return nil
        }
    }
    
    var latitude: Double? {
        if let lastLocation = locations.last {
            return lastLocation.latitude
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
