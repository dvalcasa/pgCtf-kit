//
//  Cylinder.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 16/07/2024.
//

import Foundation

public struct Cylinder: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID?
    public let rank: Int
    public var longitude: Double
    public var latitude: Double
    public var radius: Double
    public var colorRaw: Int
    public var cylinderMap: CylinderMap?
    
    public init(id: UUID? = nil,
                rank: Int,
                longitude: Double,
                latitude: Double,
                radius: Double,
                colorRaw: Int,
                cylinderMap: CylinderMap? = nil) {
        self.id = id
        self.rank = rank
        self.longitude = longitude
        self.latitude = latitude
        self.radius = radius
        self.colorRaw = colorRaw
        self.cylinderMap = cylinderMap
    }
}

public enum CylinderPoint {
    case start
    case cylinder(rank: Int)
    case goal
    
    public var rank: Int {
        switch self {
            case .start:
                return 0
            case .goal:
                return 99
            case .cylinder(let rank):
                return rank
        }
    }
    
    public var name: String {
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
