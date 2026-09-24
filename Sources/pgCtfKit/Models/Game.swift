//
//  Game.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Game: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public var name: String
    public var cylinderMapId: UUID?
    public var endAt: Date
    public var startAt: Date
    public var scoringType: String
    public var teams: [Team]
    public var status: Game.Status
    
    public var isStarted: Bool {
        switch status {
            case .new, .created:
                return false;
            default:
                return true
        }
    }
    
    public init(id: UUID? = nil,
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
    
    public enum Status: Int, Codable, Sendable {
        case new, created, started, ended, closed
    }
}
