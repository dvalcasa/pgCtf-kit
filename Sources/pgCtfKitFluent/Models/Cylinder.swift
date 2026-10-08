//
//  Cylinder.swift
//  pgCtf
//
//  Created by Didier Valcasara on 22/11/2024.
//

import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class CylinderModel: Model, @unchecked Sendable, Content {

    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.rank)
    public var rank: Int

    @Field(key: FieldKeys.latitude)
    public var latitude: Double

    @Field(key: FieldKeys.longitude)
    public var longitude: Double

    @Field(key: FieldKeys.radius)
    public var radius: Double
    
    @Field(key: FieldKeys.colorRaw)
    public var colorRaw: Int

    @OptionalParent(key: FieldKeys.cylinderMapID)
    public var cylinderMap: CylinderMapModel?

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?

    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil,
         rank: Int,
         latitude: Double,
         longitude: Double,
         radius: Double,
         colorRaw: Int,
         cylinderMapID: CylinderMapModel.IDValue? = nil) {
        self.id = id
        self.rank = rank
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
        self.colorRaw = colorRaw
        self.$cylinderMap.id = cylinderMapID
    }
}

extension CylinderModel {
    public static let schema = "cylinders"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let rank: FieldKey = "rank"
        public static let latitude: FieldKey = "latitude"
        public static let longitude: FieldKey = "longitude"
        public static let radius: FieldKey = "radius"
        public static let colorRaw: FieldKey = "colorRaw"
        public static let cylinderMapID: FieldKey = "cylinder_map_id"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
    
    public enum ValidationKeys {
        public static let id: BasicCodingKey = "id"
        public static let rank: BasicCodingKey = "rank"
        public static let latitude: BasicCodingKey = "latitude"
        public static let longitude: BasicCodingKey = "longitude"
        public static let radius: BasicCodingKey = "radius"
        public static let cylinderMapID: BasicCodingKey = "cylinderMapId"
    }
}

extension CylinderModel {
    public func toDTO() throws -> Cylinder {
        .init(id: try requireID(),
              rank: rank,
              longitude: longitude,
              latitude: latitude,
              radius: radius,
              colorRaw: colorRaw,
              cylinderMap: try cylinderMap?.toDTO() ?? nil)
    }
}

extension Collection where Element == CylinderModel {
    public func toCollection() throws -> [Cylinder] {
        return try self.map { try $0.toDTO() }
    }
}

extension Cylinder: Content {}
