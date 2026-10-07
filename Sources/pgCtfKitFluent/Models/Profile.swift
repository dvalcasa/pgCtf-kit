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
    
    enum FieldKeys {
        static let id: FieldKey = "id"
        static let userId: FieldKey = "user_id"
        static let username: FieldKey = "username"
        static let email: FieldKey = "email"
        static let firstName: FieldKey = "first_name"
        static let lastName: FieldKey = "last_name"
        static let playerName: FieldKey = "player_name"
        static let gliderId: FieldKey = "glider_id"
        static let isAdmin: FieldKey = "is_admin"
        static let status: FieldKey = "status"
        static let isRestricted: FieldKey = "is_restricted"
        
        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let deletedAt: FieldKey = "deleted_at"
    }
    
    enum ValidationKeys {
        static let id: BasicCodingKey = "id"
        static let username: BasicCodingKey = "username"
        static let password: BasicCodingKey = "password"
        static let firstName: BasicCodingKey = "firstName"
        static let lastName: BasicCodingKey = "lastName"
        static let playerName: BasicCodingKey = "playerName"
        static let gliderId: BasicCodingKey = "gliderId"
        static let email: BasicCodingKey = "email"
        static let isAdmin: BasicCodingKey = "isAdmin"
        static let isRestricted: BasicCodingKey = "isRestricted"
    }
}

extension ProfileModel {
    public func toPublic() -> ProfileModel.Public {
        .init(id: id,
              userId: userId,
              username: username,
              email: email,
              firstName: firstName,
              lastName: lastName,
              playerName: playerName,
              glider: glider,
              status: status,
              isAdmin: isAdmin,
              isRestricted: isRestricted)
    }
    
    public func toResponse() -> ProfileResponse {
        .init(id: id,
              userId: userId,
              username: username,
              email: email,
              firstName: firstName,
              lastName: lastName,
              playerName: playerName,
              gliderId: $glider.id,
              status: status,
              isAdmin: isAdmin,
              isRestricted: isRestricted
        )
    }
}

extension ProfileModel {
    public final class Public: Content {
        let id: UUID?
        let userId: UUID
        let username: String
        let email: String
        let firstName: String?
        let lastName: String?
        let playerName: String?
        let glider: GliderModel.Public?
        let status: Profile.Status
        let isAdmin: Bool
        let isRestricted: Bool
        
        public init(id: UUID?,
             userId: UUID,
             username: String,
             email: String,
             firstName: String? = nil,
             lastName: String? = nil,
             playerName: String? = nil,
             glider: GliderModel? = nil,
             status: Profile.Status,
             isAdmin: Bool,
             isRestricted: Bool) {
            self.id = id
            self.userId = userId
            self.username = username
            self.email = email
            self.firstName = firstName
            self.lastName = lastName
            self.playerName = playerName
            self.glider = glider?.toPublic()
            self.status = status
            self.isAdmin = isAdmin
            self.isRestricted = isRestricted
        }
    }
}

extension Collection where Element: ProfileModel {
    public func toPublic() -> [ProfileModel.Public] {
        return self.map { $0.toPublic() }
    }
}

extension Profile.Status {
    public static let schema = "profile_status"
    public static var space: String? { Application.spaceSpec }
}
