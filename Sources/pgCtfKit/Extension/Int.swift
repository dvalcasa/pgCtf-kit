//
//  Int.swift
//  pgCtf-kit
//
//  Created by Didier Valcasara on 24/09/2026.
//

extension Int {
    public func toCylinderRankName() -> String {
        switch self {
            case CylinderPoint.start.rank:
                return CylinderPoint.start.name
            case CylinderPoint.goal.rank:
                return CylinderPoint.goal.name
            default:
                return CylinderPoint.cylinder(rank: self).name
        }
    }
}
