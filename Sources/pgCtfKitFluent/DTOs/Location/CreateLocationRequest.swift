//
//  CreateLocationRequest.swift
//  pgCtfKit
//
//  Created by Didier Valcasara on 21/08/2026.
//

@_exported import pgCtfKit
import Vapor

extension CreateLocationRequest: Content {}

extension CreateLocationRequest {
    public func toModel() -> LocationModel {
        .init(latitude: latitude,
              longitude: longitude,
              altitude: altitude,
              timestamp: timestamp,
              playerID: playerID)
    }
}
