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

extension CylinderModel {
    public func toPublic() -> CylinderModel.Public {
        .init(id: id,
              rank: rank,
              latitude: latitude,
              longitude: longitude,
              radius: radius,
              colorRaw: colorRaw,
              cylinderMapID: $cylinderMap.id)
    }
    
    public func toResponse() -> CylinderResponse {
        .init(id: id,
              rank: rank,
              longitude: longitude,
              latitude: latitude,
              radius: radius,
              colorRaw: colorRaw,
              cylinderMapID: $cylinderMap.id
        )
    }
}

extension CylinderModel {
    public final class Public: Content {
        let id: UUID?
        let rank: Int
        let latitude: Double
        let longitude: Double
        let radius: Double
        let colorRaw: Int
        let cylinderMapID: CylinderMapModel.IDValue?

        public init(id: UUID?,
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
            self.cylinderMapID = cylinderMapID
        }
    }
}

extension CylinderModel {
    public static let schema = "cylinders"
    public static var space: String? { Application.spaceSpec }

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let rank: FieldKey = "rank"
        static let latitude: FieldKey = "latitude"
        static let longitude: FieldKey = "longitude"
        static let radius: FieldKey = "radius"
        static let colorRaw: FieldKey = "colorRaw"
        static let cylinderMapID: FieldKey = "cylinder_map_id"

        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let deletedAt: FieldKey = "deleted_at"
    }
    
    enum ValidationKeys {
        static let id: BasicCodingKey = "id"
        static let rank: BasicCodingKey = "rank"
        static let latitude: BasicCodingKey = "latitude"
        static let longitude: BasicCodingKey = "longitude"
        static let radius: BasicCodingKey = "radius"
        static let cylinderMapID: BasicCodingKey = "cylinderMapId"
    }
}

extension Collection where Element: CylinderModel {
    public func toPublic() -> [CylinderModel.Public] {
        return self.map { $0.toPublic() }
    }
}
