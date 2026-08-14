//
//  User.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 11/10/2025.
//

import Foundation

struct User: Identifiable, Codable, Sendable, Hashable {
    let id: UUID?
    let username: String
    let email: String
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let gliderId: UUID?
    let status: User.Status
    let isRestricted: Bool
    let isAdmin: Bool
    
    init(id: UUID? = nil, username: String, email: String,
         firstName: String? = nil, lastName: String? = nil, playerName: String? = nil,
         gliderId: UUID? = nil,
         isAdmin: Bool, status: User.Status, isRestricted: Bool) {
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
    
    enum Status: Int, Codable {
        case unknown, unconfirmed, activated, suspended, banned, deleted 
    }
}
