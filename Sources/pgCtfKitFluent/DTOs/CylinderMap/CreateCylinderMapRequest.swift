//
//  CreateCylinderMapRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

@_exported import pgCtfKit
import Vapor

extension CreateCylinderMapRequest: Content {}

extension CreateCylinderMapRequest {
    public func toModel() -> CylinderMapModel {
        .init(name: name,
              description: description,
              imageData: imageData)
    }
}
