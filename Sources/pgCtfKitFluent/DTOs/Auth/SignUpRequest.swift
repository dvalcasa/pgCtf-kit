//
//  SignUpRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 05/07/2026.
//

@_exported import pgCtfKit
import Vapor

extension SignUpRequest: Content {}

extension SignUpRequest {
    public func toModel() -> ProfileModel {
        .init(userId: UUID(),
              username: username,
              email: email,
              firstName: firstName,
              lastName: lastName,
              playerName: playerName,
              gliderID: gliderID,
              isRestricted: isRestricted)
    }
}

extension SignUpRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
        validations
            .add(ProfileModel.ValidationKeys.username, as: String.self, is: .count(5...) && .alphanumeric,
                 customFailureDescription: "Username must be least 5 characters long.")
        
        validations.add(ProfileModel.ValidationKeys.password, as: String.self, is: .count(8...),
                        customFailureDescription: "Password must be least 8 characters long.")
        
        validations.add(ProfileModel.ValidationKeys.email, as: String.self, is: .email)
    }
}
