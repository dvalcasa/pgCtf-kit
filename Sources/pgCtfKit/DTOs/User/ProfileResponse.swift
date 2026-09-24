//
//  ProfileDTO.swift
//  pgCtf
//
//  Created by Didier Valcasara on 04/07/2026.
//

import Foundation

public struct ProfileResponse {
    public let id: UUID?
    public let userId: UUID
    public let username: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderId: UUID?
    public let status: Profile.Status
    public let isAdmin: Bool
    public let isRestricted: Bool
    
    public init(id: UUID?,
                userId: UUID,
                username: String,
                email: String,
                firstName: String?,
                lastName: String?,
                playerName: String?,
                gliderId: UUID?,
                status: Profile.Status,
                isAdmin: Bool,
                isRestricted: Bool) {
        self.id = id
        self.userId = userId
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

public struct UpsertProfileInput {
    public let displayName: String
    public let bio: String?
    
    public init(displayName: String,
                bio: String? = nil) {
        self.displayName = displayName
        self.bio = bio
    }
}
