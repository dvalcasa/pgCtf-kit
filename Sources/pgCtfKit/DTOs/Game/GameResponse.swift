//
//  GameResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/01/2025.
//

import Foundation

public struct GameResponse: Codable, Sendable {
    public let id: UUID?
    public let name: String
    public let scoringType: ScoringType
    public let startAt: String
    public let endAt: String
    public let cylinderMapID: UUID?
    public let status: Game.Status
    
    public init(id: UUID? = nil,
                name: String,
                scoringType: ScoringType,
                startAt: String,
                endAt: String,
                cylinderMapID: UUID?,
                status: Game.Status) {
        self.id = id
        self.name = name
        self.scoringType = scoringType
        self.startAt = startAt
        self.endAt = endAt
        self.cylinderMapID = cylinderMapID
        self.status = status
    }
}
