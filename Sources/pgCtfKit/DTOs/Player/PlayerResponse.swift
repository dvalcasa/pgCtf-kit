//
//  PlayerResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 02/04/2025.
//

import Foundation

public struct PlayerResponse: Codable, Sendable {
    public let id: UUID?
    public let name: String
    public let profileID: UUID
    public let teamID: UUID?
    
    public init(id: UUID?,
                name: String,
                profileID: UUID,
                teamID: UUID? = nil) {
        self.id = id
        self.name = name
        self.profileID = profileID
        self.teamID = teamID
    }
}
