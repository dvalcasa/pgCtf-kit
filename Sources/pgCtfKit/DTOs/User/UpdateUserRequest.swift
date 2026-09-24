//
//  UpdateUserRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/11/2025.
//

import Foundation

public struct UpdateUserRequest: Encodable {
    public let username: String?
    public let firstName: String?
    public let lastName: String?
    public let playerName: String?
    public let email: String?
    public let gliderId: UUID?
    public let isRestricted: Bool?
    
    public init(username: String? = nil,
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
