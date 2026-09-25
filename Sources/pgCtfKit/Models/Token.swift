//
//  Token.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/02/2025.
//

import Foundation

public struct Token: Codable, Hashable {
    public var userId: UUID?
    public var token: String
    
    public init(token: String) {
        self.token = token
    }
    
    public init(userId: UUID,
                token: String) {
        self.userId = userId
        self.token = token
    }
}
