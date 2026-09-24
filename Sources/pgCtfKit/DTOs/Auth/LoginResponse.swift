//
//  LoginResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 02/04/2025.
//

import Foundation

public struct LoginResponse: Decodable {
    public let token: String
    public let userId: UUID
    
    public init(token: String, userId: UUID) {
        self.token = token
        self.userId = userId
    }
}
