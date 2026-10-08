//
//  CylinderMap.swift
//  pgCtf
//
//  Created by Didier Valcasara on 20/12/2024.
//

import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class CylinderMapModel: Model, @unchecked Sendable {

    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.name)
    public var name: String
    
    @OptionalField(key: FieldKeys.description)
    public var description: String?
    
    @OptionalField(key: FieldKeys.imageData)
    public var imageData: Data?

    @Children(for: \.$cylinderMap)
    public var cylinders: [CylinderModel]

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?

    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil,
                name: String,
                description: String? = nil,
                imageData: Data? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.imageData = imageData
    }
    
    public func toDTO() throws -> CylinderMap {
        .init(id: try requireID(),
              name: name,
              description: description,
              imageData: imageData,
              cylinders: try cylinders.map { try $0.toDTO() })
    }
}

extension CylinderMapModel {
    public static let schema = "cylinders_map"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let name: FieldKey = "name"
        public static let description: FieldKey = "description"
        public static let imageData: FieldKey = "image"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
}

extension Collection where Element == CylinderMapModel {
    public func toCollection() throws -> [CylinderMap] {
        return try self.map { try $0.toDTO() }
    }
}

extension CylinderMap: Content {}
