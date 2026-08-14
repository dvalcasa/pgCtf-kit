//
//  UpdateUserRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/11/2025.
//

import Foundation

struct UpdateUserRequest: Codable {
    let username: String?
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let email: String?
    let gliderId: UUID?
    let isRestricted: Bool?
    
    init(username: String? = nil,
         email: String? = nil,
         firstName: String? = nil,
         lastName: String? = nil,
         playerName: String? = nil,
         gliderId: UUID? = nil,
         isRestricted: Bool? = nil) {
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.gliderId = gliderId
        self.isRestricted = isRestricted
    }
}
