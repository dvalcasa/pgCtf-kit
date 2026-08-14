//
//  UserResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/03/2025.
//

import Foundation

struct UserResponse: Codable {
    let id: UUID
    let username: String
    let email: String
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let gliderId: UUID?
    let status: User.Status
    let isAdmin: Bool
    let isRestricted: Bool
    
    init(id: UUID,
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
