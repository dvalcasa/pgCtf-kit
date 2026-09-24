//
//  CreateCylinderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CreateCylinderRequest: Codable {
    public let rank: Int
    public let latitude: Double
    public let longitude: Double
    public let radius: Double
    public let cylinderMapId: UUID
    public let colorRaw: Int
}

