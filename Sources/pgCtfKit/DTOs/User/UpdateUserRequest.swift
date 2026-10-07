//
//  UpdateUserRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/11/2025.
//

import Foundation

public struct UpdateUserRequest: Codable, Sendable {
    public let username: String?
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let email: String?
    public let gliderID: UUID?
    public let isRestricted: Bool?
    
    public init(username: String? = nil,
                email: String? = nil,
                firstName: String? = nil,
                lastName: String? = nil,
                playerName: String? = nil,
                gliderID: UUID? = nil,
                isRestricted: Bool? = nil) {
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.gliderID = gliderID
        self.isRestricted = isRestricted
    }
}
