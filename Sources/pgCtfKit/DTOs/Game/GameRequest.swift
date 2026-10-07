//
//  GameRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 12/02/2025.
//

import Foundation

public struct GameRequest: Codable, Sendable {
    public let name: String?
    public let scoringType: ScoringType?
    public let cylinderMapID: UUID?
    public let startAt: String?
    public let endAt: String?
    public let status: Game.Status?
    
    public init(name: String? = nil,
                scoringType: ScoringType? = nil,
                cylinderMapID: UUID? = nil,
                startAt: String? = nil,
                endAt: String? = nil,
                status: Game.Status? = nil) {
        self.name = name
        self.scoringType = scoringType
        self.cylinderMapID = cylinderMapID
        self.startAt = startAt
        self.endAt = endAt
        self.status = status
    }
}
