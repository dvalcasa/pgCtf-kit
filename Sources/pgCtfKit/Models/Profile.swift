//
//  Profile.swift
//  pgCtf
//
//  Created by Didier Valcasara on 09/07/2026.
//

import Foundation

public struct Profile {
    let id: UUID?
    let userId: UUID
    let username: String
    let email: String
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let gliderId: UUID?
    let status: Profile.Status
    let isRestricted: Bool
    let isAdmin: Bool
    
    init(id: UUID? = nil,
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
    enum Status: Int, Codable {
        case notSubscribe, waiting, activated
    }
}
