//
//  SignUpRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

public struct SignUpRequest: Codable, Sendable {
    public let username: String
    public let password: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderID: UUID?
    public let isRestricted: Bool?
    
    public init(username: String,
                password: String,
                email: String,
                firstName: String? = nil,
                lastName: String? = nil,
                playerName: String? = nil,
                gliderID: UUID? = nil,
                isRestricted: Bool? = true) {
        self.username = username
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.gliderID = gliderID
        self.isRestricted = isRestricted
    }
}
