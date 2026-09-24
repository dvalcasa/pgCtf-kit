//
//  TokenResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

public struct TokenResponse {
    public let accessToken: String?
    public let refreshToken: String?
    public let userId: UUID?
}
