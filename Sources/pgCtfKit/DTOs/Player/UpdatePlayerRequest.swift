//
//  UpdatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

import Foundation

public struct UpdatePlayerRequest: Codable {
    public let name: String?
    public let teamId: UUID?
    
    public init(name: String? = nil,
                teamId: UUID? = nil) {
        self.name = name
        self.teamId = teamId
    }
}

