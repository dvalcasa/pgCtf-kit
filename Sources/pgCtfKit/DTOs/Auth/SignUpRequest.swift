//
//  SignUpRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

public struct SignUpRequest {
    let username: String
    let password: String
    let email: String
    let firstName: String?
    let lastName: String?
    let playerName: String?
    let gliderId: UUID?
    let isRestricted: Bool?
    
    init(username: String,
         password: String,
         email: String,
         firstName: String? = nil,
         lastName: String? = nil,
         playerName: String? = nil,
         gliderId: UUID? = nil,
         isRestricted: Bool? = true) {
        self.username = username
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.gliderId = gliderId
        self.isRestricted = isRestricted
    }
}
