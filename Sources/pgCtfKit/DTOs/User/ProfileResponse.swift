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
}

public struct UpsertProfileInput {
    public let displayName: String
    public let bio: String?
}
