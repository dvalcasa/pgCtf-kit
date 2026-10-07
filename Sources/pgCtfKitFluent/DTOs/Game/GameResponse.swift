//
//  GameResponse.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/01/2025.
//

import pgCtfKit
import Vapor

extension GameResponse: Content {}

extension GameResponse {
    public func toDTO() throws -> GameModel {
        .init(id: id,
              name: name,
              scoringType: scoringType,
              startAt: startAt.ISO8601FormatToDate(),
              endAt: endAt.ISO8601FormatToDate(),
              cylinderMapID: cylinderMapID,
              status: status)
    }
}
