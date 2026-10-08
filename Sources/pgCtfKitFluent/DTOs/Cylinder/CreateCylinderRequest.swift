//
//  CreateCylinderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

@_exported import pgCtfKit
import Vapor

extension CreateCylinderRequest: Content {}

extension CreateCylinderRequest {
    public func toModel() -> CylinderModel {
        .init(rank: rank,
              latitude: latitude,
              longitude: longitude,
              radius: radius,
              colorRaw: colorRaw,
              cylinderMapID: cylinderMapID)
    }
}
