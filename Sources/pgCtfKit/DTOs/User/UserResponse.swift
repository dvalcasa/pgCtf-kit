//
//  UserResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/03/2025.
//

import Foundation

public struct UserResponse: Codable, Sendable {
    public let id: UUID?
    public let username: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderId: UUID?
    public let status: User.Status
    public let isAdmin: Bool
    public let isRestricted: Bool
    
    public init(id: UUID?,
                username: String,
                email: String,
                firstName: String? = nil,
                lastName: String? = nil,
                playerName: String? = nil,
                gliderId: UUID? = nil,
                status: User.Status,
                isAdmin: Bool,
                isRestricted: Bool) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.gliderId = gliderId
        self.status = status
        self.isAdmin = isAdmin
        self.isRestricted = isRestricted
    }
}

extension UserResponse {
    public func toModel() -> User {
        User(id: id,
             username: username,
             email: email,
             firstName: firstName,
             lastName: lastName,
             playerName: playerName,
             gliderId: gliderId,
             isAdmin: isAdmin,
             status: status,
             isRestricted: isRestricted)
    }
}
