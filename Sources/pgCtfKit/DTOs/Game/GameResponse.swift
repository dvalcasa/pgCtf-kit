//
//  GameResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/01/2025.
//

import Foundation

struct GameResponse: Codable, Sendable {
    let id: UUID?
    let name: String
    let scoringType: String
    let startAt: String
    let endAt: String
    let cylinderMapId: UUID?
    let status: Game.Status
    
    init(id: UUID? = nil,
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
