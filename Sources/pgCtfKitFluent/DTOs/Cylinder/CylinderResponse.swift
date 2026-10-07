//
//  CylinderResponse.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 05/05/2025.
//

import pgCtfKit
import Vapor

extension CylinderResponse: Content {}

extension CylinderResponse {
    public func toDTO() -> Cylinder {
        .init(id: id,
              rank: rank,
              longitude: longitude,
              latitude: latitude,
              radius: radius,
              colorRaw: colorRaw)
    }
}
