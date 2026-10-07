//
//  CreatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

import Foundation

public struct CreatePlayerRequest: Codable, Sendable {
    public let name: String
    public let profileID: UUID
    public let teamID: UUID?
    
    public init(name: String,
                profileID: UUID,
                teamID: UUID? = nil) {
        self.name = name
        self.profileID = profileID
        self.teamID = teamID
    }
}
