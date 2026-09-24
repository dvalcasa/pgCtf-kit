//
//  PlayerResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 02/04/2025.
//

import Foundation

public struct PlayerResponse: Decodable {
    public let id: UUID?
    public let name: String
    public let userId: UUID
    public let teamId: UUID?
    
    public init(id: UUID?,
                name: String,
                userId: UUID,
                teamId: UUID? = nil) {
        self.id = id
        self.name = name
        self.userId = userId
        self.teamId = teamId
    }
}
