//
//  ScoringType.swift
//
//
//  Created by Didier Valcasara on 17/11/2024.
//

import pgCtfKit
import Vapor

extension ScoringType {
    public static let schema = "scoring_types"
    public static var space: String? { Application.spaceSpec }
}

extension ScoringType: Content {}
