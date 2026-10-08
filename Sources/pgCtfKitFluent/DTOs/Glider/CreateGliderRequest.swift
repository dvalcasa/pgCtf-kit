//
//  CreateGliderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 13/11/2025.
//

@_exported import pgCtfKit
import Vapor

extension CreateGliderRequest: Content {}

extension CreateGliderRequest {
    public func toModel() -> GliderModel {
        .init(brand: brand,
              model: model,
              size: size,
              colorName: colorName,
              colors: colors)
    }
}
