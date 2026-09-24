//
//  Gaming.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 20/01/2026.
//

import Foundation

public struct Gaming: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let name: String
    public let cylinderMap: CylinderMap
    public let endAt: Date
    public let startAt: Date
    public let scoringType: String
    public let teams: [Team]
    
    public var isStarted: Bool { startAt <= .now }
    
    public init() {
        self.id = nil
        self.name = ""
        self.cylinderMap = .init(name: "", cylinders: [])
        self.endAt = .distantFuture
        self.startAt = .distantPast
        self.scoringType = "points"
        self.teams = []
    }
    
    public init(id: UUID? = nil,
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

