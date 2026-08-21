//
//  PlayerResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 02/04/2025.
//

import Foundation

public struct PlayerResponse: Codable {
    let id: UUID?
    let name: String
    let userId: UUID
    let teamId: UUID?
    
    init(id: UUID?,
         name: String,
         userId: UUID,
         teamId: UUID? = nil) {
        self.id = id
        self.name = name
        self.userId = userId
        self.teamId = teamId
    }
}
