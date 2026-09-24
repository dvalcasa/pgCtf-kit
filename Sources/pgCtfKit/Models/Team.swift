//
//  Team.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Team: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let name: String
    public let color: Int
    public let nbPlayersMax: Int
    public let players: [Player]
    public let gameId: UUID?
    
    public init(id: UUID? = nil,
                name: String,
                color: Int,
                nbPlayersMax: Int,
                players: [Player] = [],
                gameId: UUID? = nil) {
        self.id = id
        self.name = name
        self.color = color
        self.nbPlayersMax = nbPlayersMax
        self.players = players
        self.gameId = gameId
    }
}
