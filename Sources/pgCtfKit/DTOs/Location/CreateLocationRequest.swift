//
//  CreateLocationRequest.swift
//  pgCtf
//
//  Created by Didier Valcasara on 14/08/2026.
//

import Foundation

public struct CreateLocationRequest {
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let timestamp: Date
    let playerId: UUID
}
