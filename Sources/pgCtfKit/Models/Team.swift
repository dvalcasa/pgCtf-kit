//
//  Team.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Team {
    let id: UUID?
    let name: String
    let color: Int
    let nbPlayersMax: Int
    let players: [Player]
    let gameId: UUID?
    
    init(id: UUID? = nil,
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
