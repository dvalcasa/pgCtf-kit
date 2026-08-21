//
//  CreateCylinderRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 26/11/2025.
//

import Foundation

public struct CreateCylinderRequest: Codable {
    let rank: Int
    let latitude: Double
    let longitude: Double
    let radius: Double
    let cylinderMapId: UUID
    let colorRaw: Int
}

