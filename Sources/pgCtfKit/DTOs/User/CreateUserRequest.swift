//
//  CreateUserRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/11/2025.
//

import Foundation

public struct CreateUserRequest: Encodable {
    public let username: String
    public let password: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let gliderId: UUID?
    public let isRestricted: Bool?
    
    public init(username: String,
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
