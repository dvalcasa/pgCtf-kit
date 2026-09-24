//
//  CreatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

import Foundation

public struct CreatePlayerRequest: Encodable {
    public let name: String
    public let userId: UUID
    public let teamId: UUID?
    
    public init(name: String,
                userId: UUID,
                teamId: UUID? = nil) {
        self.name = name
        self.userId = userId
        self.teamId = teamId
    }
}
