//
//  ProfileDTO.swift
//  pgCtf
//
//  Created by Didier Valcasara on 04/07/2026.
//

import Foundation

public struct ProfileResponse {
    let id: UUID?
    let userId: UUID
    let username: String
    let email: String
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let gliderId: UUID?
    let status: Profile.Status
    let isAdmin: Bool
    let isRestricted: Bool
}

public struct UpsertProfileInput {
    let displayName: String
    let bio: String?
}
