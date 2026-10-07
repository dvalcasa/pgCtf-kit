//
//  ScoringType.swift
//
//
//  Created by Didier Valcasara on 17/11/2024.
//

import pgCtfKit
import Vapor

extension ScoringType {
    static let schema = "scoring_types"
    static var space: String? { Application.spaceSpec }
}
