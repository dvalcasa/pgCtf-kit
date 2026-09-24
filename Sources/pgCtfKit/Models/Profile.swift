//
//  Profile.swift
//  pgCtf
//
//  Created by Didier Valcasara on 09/07/2026.
//

import Foundation

public struct Profile: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let userId: UUID
    public let username: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderId: UUID?
    public let status: Profile.Status
    public let isRestricted: Bool
    public let isAdmin: Bool
    
    public init(id: UUID? = nil,
                userId: UUID,
                username: String,
                email: String,
                firstName: String? = nil,
                lastName: String? = nil,
                playerName: String? = nil,
                gliderId: UUID? = nil,
                isAdmin: Bool,
                status: Profile.Status,
                isRestricted: Bool) {
        self.id = id
        self.userId = userId
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.isAdmin = isAdmin
        self.status = status
        self.isRestricted = isRestricted
        self.gliderId = gliderId
    }
}

extension Profile {
    public enum Status: Int, Codable, Sendable {
        case notSubscribe, waiting, activated
    }
}
