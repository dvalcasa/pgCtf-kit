//
//  MeResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

public struct MeResponse: Decodable {
    public let id: UUID
    public let email: String?
    public let role: String?
    
    public init(id: UUID,
                email: String? = nil,
                role: String? = nil) {
        self.id = id
        self.email = email
        self.role = role
    }
}
