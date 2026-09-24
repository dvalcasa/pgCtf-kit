//
//  User.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 11/10/2025.
//

import Foundation

public struct User: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let username: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderId: UUID?
    public let status: User.Status
    public let isRestricted: Bool
    public let isAdmin: Bool
    
    public init(id: UUID? = nil,
                username: String,
                email: String,
                firstName: String? = nil,
                lastName: String? = nil,
                playerName: String? = nil,
                gliderId: UUID? = nil,
                isAdmin: Bool,
                status: User.Status,
                isRestricted: Bool) {
        self.id = id
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
    
    public enum Status: Int, Codable, Sendable {
        case unknown, unconfirmed, activated, suspended, banned, deleted
    }
}
