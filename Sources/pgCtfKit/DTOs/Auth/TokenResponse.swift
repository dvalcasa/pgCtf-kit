//
//  TokenResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

public struct TokenResponse: Decodable {
    public let accessToken: String?
    public let refreshToken: String?
    public let userId: UUID?
    
    public init(accessToken: String? = nil,
                refreshToken: String? = nil,
                userId: UUID? = nil) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.userId = userId
    }
}
