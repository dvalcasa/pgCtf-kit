//
//  UpdatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

import Foundation

public struct UpdatePlayerRequest: Codable, Sendable {
    public let name: String?
    public let teamID: UUID?
    
    public init(name: String? = nil,
                teamID: UUID? = nil) {
        self.name = name
        self.teamID = teamID
    }
}

