//
//  TeamResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 19/02/2025.
//

import Foundation

public struct TeamResponse: Codable, Sendable {
    let id: UUID?
    let name: String
    let color: Int
    let score: Int
    let gameId: UUID
    let nbPlayersMax: Int
    
    init(id: UUID?,
         name: String,
         color: Int,
         score: Int,
         gameId: UUID,
         nbPlayersMax: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.score = score
        self.nbPlayersMax = nbPlayersMax
        self.gameId = gameId
    }
}
