//
//  Profile.swift
//  pgCtf
//
//  Created by Didier Valcasara on 09/07/2026.
//

import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class ProfileModel: Model, @unchecked Sendable {
    
    @ID(key: .id)
    public var id: UUID?
    
    @Field(key: FieldKeys.userId)
    public var userId: UUID
    
    @Field(key: FieldKeys.username)
    public var username: String
    
    @Field(key: FieldKeys.email)
    public var email: String
    
    @OptionalField(key: FieldKeys.firstName)
    public var firstName: String?
    
    @OptionalField(key: FieldKeys.lastName)
    public var lastName: String?
    
    @OptionalField(key: FieldKeys.playerName)
    public var playerName: String?
    
    @OptionalParent(key: FieldKeys.gliderId)
    public var glider: GliderModel?
    
    @Field(key: FieldKeys.status)
    public var status: Profile.Status
    
    @Field(key: FieldKeys.isRestricted)
    public var isRestricted: Bool
    
    @Field(key: FieldKeys.isAdmin)
    public var isAdmin: Bool
    
    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?
    
    public init() {}
    
    public init(id: UUID? = nil,
         userId: UUID,
         username: String,
         email: String,
         firstName: String? = nil,
         lastName: String? = nil,
         playerName: String? = nil,
         glider: GliderModel? = nil,
         isAdmin: Bool,
         status: Profile.Status,
         isRestricted: Bool) {
        self.id = id
        self.userId = userId
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.playerName = playerName
        self.isAdmin = isAdmin
        self.status = status
        self.isRestricted = isRestricted
        self.$glider.id = glider?.id
    }
}

extension ProfileModel {
    public static let schema = "profiles"
    public static var space: String? { Application.spaceSpec }
    
    public var name: String {
        if let name = firstName {
            return name
        } else {
            return username
        }
    }
    
    public var fullName: String {
        if firstName != nil && !((firstName?.isEmpty) != nil) && lastName != nil && !((lastName?.isEmpty) != nil)  {
            return "\(firstName!) \(lastName!)"
        } else {
            return name
        }
    }
    
    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let userId: FieldKey = "user_id"
        public static let username: FieldKey = "username"
        public static let email: FieldKey = "email"
        public static let firstName: FieldKey = "first_name"
        public static let lastName: FieldKey = "last_name"
        public static let playerName: FieldKey = "player_name"
        public static let gliderId: FieldKey = "glider_id"
        public static let isAdmin: FieldKey = "is_admin"
        public static let status: FieldKey = "status"
        public static let isRestricted: FieldKey = "is_restricted"
        
        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
    
    public enum ValidationKeys {
        public static let id: BasicCodingKey = "id"
        public static let username: BasicCodingKey = "username"
        public static let password: BasicCodingKey = "password"
        public static let firstName: BasicCodingKey = "firstName"
        public static let lastName: BasicCodingKey = "lastName"
        public static let playerName: BasicCodingKey = "playerName"
        public static let gliderId: BasicCodingKey = "gliderId"
        public static let email: BasicCodingKey = "email"
        public static let isAdmin: BasicCodingKey = "isAdmin"
        public static let isRestricted: BasicCodingKey = "isRestricted"
    }
}

extension ProfileModel {
    public func toDTO() throws -> Profile {
        .init(id: try requireID(),
              userId: userId,
              username: username,
              email: email,
              firstName: firstName,
              lastName: lastName,
              playerName: playerName,
              glider: try glider?.toDTO(),
              isAdmin: isAdmin,
              status: status,
              isRestricted: isRestricted)
    }
}

extension Collection where Element: ProfileModel {
    public func toCollection() throws -> [Profile] {
        return try self.map { try $0.toDTO() }
    }
}

extension Profile: Content {}

extension Profile.Status {
    public static let schema = "profile_status"
    public static var space: String? { Application.spaceSpec }
}

extension Profile.Status: Content {}
