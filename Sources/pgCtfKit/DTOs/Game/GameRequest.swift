//
//  GameRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 12/02/2025.
//

import Foundation

public struct GameRequest: Codable {
    let name: String?
    let scoringType: String?
    let cylinderMapId: UUID?
    let startAt: String?
    let endAt: String?
    let status: Game.Status?
    
    init(name: String? = nil,
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
