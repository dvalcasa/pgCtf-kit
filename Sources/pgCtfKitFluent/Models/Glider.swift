//
//  Glider.swift
//  pgCtf
//
//  Created by Didier Valcasara on 20/12/2024.
//

import Fluent
import Vapor
import pgCtfKit

public final class GliderModel: Model, @unchecked Sendable {

    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.brand)
    public var brand: String

    @Field(key: FieldKeys.model)
    public var model: String

    @Field(key: FieldKeys.size)
    public var size: String

    @Field(key: FieldKeys.colorName)
    public var colorName: String
    
    @OptionalField(key: FieldKeys.colors)
    public var colors: [Int]?

    @Children(for: \.$glider)
    public var users: [ProfileModel]

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?

    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil,
                brand: String,
                model: String,
                size: String,
                colorName: String,
                colors: [Int]? = nil) {
        self.id = id
        self.brand = brand
        self.model = model
        self.size = size
        self.colorName = colorName
        self.colors = colors
    }
}

extension GliderModel {
    public static let schema = "gliders"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let brand: FieldKey = "brand"
        public static let model: FieldKey = "model"
        public static let size: FieldKey = "size"
        public static let colorName: FieldKey = "colorName"
        public static let colors: FieldKey = "colors"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
}

extension GliderModel {
    public func toDTO() throws -> Glider {
        .init(id: try requireID(),
              brand: brand,
              model: model,
              size: size,
              colorName: colorName,
              colors: colors)
    }
}

extension Collection where Element: GliderModel {
    public func toCollection() throws -> [Glider] {
        return try self.map { try $0.toDTO() }
    }
}
