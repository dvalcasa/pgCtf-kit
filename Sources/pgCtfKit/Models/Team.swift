//
//  Team.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

struct Team: Identifiable, Codable, Sendable, Hashable {
    let id: UUID?
    var name: String
    var color: Int
    var nbPlayersMax: Int
    var players: [Player]
    var gameId: UUID?
    
    init(id: UUID? = nil, name: String, color: Int, nbPlayersMax: Int, players: [Player] = [], gameId: UUID? = nil) {
        self.id = id
        self.name = name
        self.color = color
        self.nbPlayersMax = nbPlayersMax
        self.players = players
        self.gameId = gameId
    }
}
