//
//  LoginRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

public struct LoginRequest: Encodable {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
