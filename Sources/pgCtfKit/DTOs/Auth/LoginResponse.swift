//
//  LoginResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 02/04/2025.
//

import Foundation

public struct LoginResponse: Codable {
    let token: String
    let userId: UUID
}
