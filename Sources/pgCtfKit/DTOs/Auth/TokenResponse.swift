//
//  TokenResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

import Foundation

struct TokenResponse {
    let accessToken: String?
    let refreshToken: String?
    let userId: UUID?
}
