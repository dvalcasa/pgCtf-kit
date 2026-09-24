//
//  GameRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 12/02/2025.
//

import Foundation

public struct GameRequest: Codable {
    public let name: String?
    public let scoringType: String?
    public let cylinderMapId: UUID?
    public let startAt: String?
    public let endAt: String?
    public let status: Game.Status?
    
    public init(name: String? = nil,
                scoringType: String? = nil,
                cylinderMapId: UUID? = nil,
                startAt: String? = nil,
                endAt: String? = nil,
                status: Game.Status? = nil) {
        self.name = name
        self.scoringType = scoringType
        self.cylinderMapId = cylinderMapId
        self.startAt = startAt
        self.endAt = endAt
        self.status = status
    }
}
