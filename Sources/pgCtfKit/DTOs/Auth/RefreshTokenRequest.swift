//
//  RefreshTokenRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

public struct RefreshTokenRequest: Encodable {
    public let refreshToken: String
    
    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
