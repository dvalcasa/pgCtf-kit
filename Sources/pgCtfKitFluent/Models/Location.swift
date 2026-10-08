//
//  Location.swift
//  pgCtf
//
//  Created by Didier Valcasara on 23/11/2024.
//

import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class LocationModel: Model, @unchecked Sendable {
    
    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.latitude)
    public var latitude: Double

    @Field(key: FieldKeys.longitude)
    public var longitude: Double

    @Field(key: FieldKeys.altitude)
    public var altitude: Double
    
    @Field(key: FieldKeys.timestamp)
    public var timestamp: Date
    
    @Parent(key: FieldKeys.playerId)
    public var player: PlayerModel

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?
            
    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() { }

    public init(id: UUID? = nil,
         latitude: Double,
         longitude: Double,
         altitude: Double,
         timestamp: Date,
         playerID: PlayerModel.IDValue) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.timestamp = timestamp
        self.$player.id = playerID
    }
}

extension LocationModel {
    public static let schema = "locations"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let latitude: FieldKey = "latitude"
        public static let longitude: FieldKey = "longitude"
        public static let altitude: FieldKey = "altitude"
        public static let timestamp: FieldKey = "timestamp"
        public static let playerId: FieldKey = "player_id"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
    
    public enum ValidationKeys {
        public static let id: BasicCodingKey = "id"
        public static let latitude: BasicCodingKey = "latitude"
        public static let longitude: BasicCodingKey = "longitude"
        public static let altitude: BasicCodingKey = "altitude"
        public static let timestamp: BasicCodingKey = "timestamp"
        public static let playerId: BasicCodingKey = "playerId"
    }
}

extension LocationModel {
    public func toDTO() throws -> Location {
        .init(id: try requireID(),
              longitude: longitude,
              latitude: latitude,
              altitude: altitude,
              timestamp: timestamp,
              player: try player.toDTO())
    }
}

extension Collection where Element: LocationModel {
    public func toCollection() throws -> [Location] {
        return try self.map { try $0.toDTO() }
    }
}

extension Location: Content {}
