//
//  Cylinder.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Cylinder {
    let id: UUID?
    let rank: Int
    var longitude: Double
    var latitude: Double
    var radius: Double
    var cylinderMapId: UUID?
    
    init(id: UUID? = nil,
         rank: Int,
         longitude: Double,
         latitude: Double,
         radius: Double,
         cylinderMapId: UUID? = nil) {
        self.id = id
        self.rank = rank
        self.longitude = longitude
        self.latitude = latitude
        self.radius = radius
        self.cylinderMapId = cylinderMapId
    }
}

public enum CylinderPoint {
    case start
    case cylinder(rank: Int)
    case goal
    
    var rank: Int {
        switch self {
            case .start:
                return 0
            case .goal:
                return 99
            case .cylinder(let rank):
                return rank
        }
    }
    
    var name: String {
        switch self {
            case .start:
                return "Start"
            case .goal:
                return "Goal"
            case .cylinder:
                return "#\(rank)"
        }
    }
}
