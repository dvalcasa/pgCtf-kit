//
//  CreatePlayerRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/12/2025.
//

@_exported import pgCtfKit
import Vapor

extension CreatePlayerRequest: Content {}

extension CreatePlayerRequest {
    public func toModel() -> PlayerModel {
        .init(name: name,
              profileID: profileID,
              teamID: teamID)
    }
}
