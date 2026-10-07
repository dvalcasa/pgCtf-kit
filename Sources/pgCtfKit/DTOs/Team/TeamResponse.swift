//
//  TeamResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 19/02/2025.
//

import Foundation

public struct TeamResponse: Codable, Sendable {
    public let id: UUID?
    public let name: String
    public let color: Int
    public let score: Int
    public let gameID: UUID
    public let nbPlayersMax: Int
    
    public init(id: UUID?,
                name: String,
                color: Int,
                score: Int,
                gameID: UUID,
                nbPlayersMax: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.score = score
        self.nbPlayersMax = nbPlayersMax
        self.gameID = gameID
    }
}
