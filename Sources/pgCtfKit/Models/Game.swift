//
//  Game.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Game {
    let id: UUID?
    var name: String
    var cylinderMapId: UUID?
    var endAt: Date
    var startAt: Date
    var scoringType: String
    var teams: [Team]
    var status: Game.Status
    
    var isStarted: Bool {
        switch status {
            case .new, .created:
                return false;
            default:
                return true
        }
    }
    
    init(id: UUID? = nil,
         name: String,
         cylinderMapId: UUID? = nil,
         startAt: Date,
         endAt: Date,
         scoringType: String,
         teams: [Team] = [],
         status: Game.Status) {
        self.id = id
        self.name = name
        self.cylinderMapId = cylinderMapId
        self.endAt = endAt
        self.startAt = startAt
        self.scoringType = scoringType
        self.teams = teams
        self.status = status
    }
    
    enum Status: Int, Codable {
        case new, created, started, ended, closed
    }
}
