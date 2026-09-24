//
//  GameResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/01/2025.
//

import Foundation

public struct GameResponse: Decodable {
    public let id: UUID?
    public let name: String
    public let scoringType: String
    public let startAt: String
    public let endAt: String
    public let cylinderMapId: UUID?
    public let status: Game.Status
    
    public init(id: UUID? = nil,
                name: String,
                scoringType: String,
                startAt: String,
                endAt: String,
                cylinderMapId: UUID?,
                status: Game.Status) {
        self.id = id
        self.name = name
        self.scoringType = scoringType
        self.startAt = startAt
        self.endAt = endAt
        self.cylinderMapId = cylinderMapId
        self.status = status
    }
}
