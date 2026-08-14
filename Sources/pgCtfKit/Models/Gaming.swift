//
//  Gaming.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 20/01/2026.
//

import Foundation

struct Gaming: Identifiable, Codable, Sendable, Hashable {
    let id: UUID?
    let name: String
    let cylinderMap: CylinderMap
    let endAt: Date
    let startAt: Date
    let scoringType: String
    let teams: [Team]
    
    var isStarted: Bool { startAt <= .now }
    
    init(id: UUID? = nil,
         name: String,
         cylinderMap: CylinderMap,
         startAt: Date,
         endAt: Date,
         scoringType: String,
         teams: [Team] = []) {
        self.id = id
        self.name = name
        self.cylinderMap = cylinderMap
        self.endAt = endAt
        self.startAt = startAt
        self.scoringType = scoringType
        self.teams = teams
    }
}

