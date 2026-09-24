//
//  Token.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/02/2025.
//

import Foundation

public struct Token: Codable, Hashable, Sendable {
    public var userId: UUID?
    public var token: String
    
    init(token: String) {
        self.token = token
    }
    
    init(userId: UUID, token: String) {
        self.userId = userId
        self.token = token
    }
}
