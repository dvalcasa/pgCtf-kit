//
//  CreatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

import Foundation

public struct CreatePlayerRequest: Codable {
    let name: String
    let userId: UUID
    let teamId: UUID?
    
    init(name: String, userId: UUID, teamId: UUID? = nil) {
        self.name = name
        self.userId = userId
        self.teamId = teamId
    }
}
