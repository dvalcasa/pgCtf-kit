import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class PlayerModel: Model, @unchecked Sendable {
    
    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.name)
    public var name: String

    @Parent(key: FieldKeys.userId)
    public var user: ProfileModel
    
    @OptionalParent(key: FieldKeys.teamId)
    public var team: TeamModel?
    
    @Children(for: \.$player)
    public var locations: [LocationModel]

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?
        
    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?
    
    public init() {}

    public init(id: UUID? = nil,
                name: String,
                userId: ProfileModel.IDValue,
                teamId: TeamModel.IDValue? = nil) {
        self.id = id
        self.name = name
        self.$user.id = userId
        self.$team.id = teamId
    }
    
    public func toDTO() throws -> Player {
        .init(id: try requireID(),
              name: name,
              user: try user.toDTO(),
              team: try team?.toDTO(),
              locations: try locations.map { try $0.toDTO() })
    }
}

extension PlayerModel {
    public func toPublic() -> PlayerModel.Public {
        .init(id: id,
              name: name,
              user: user,
              team: team,
              locations: locations)
    }
    
    public func toResponse() -> PlayerResponse {
        .init(id: id,
              name: name,
              profileID: $user.id,
              teamID: $team.id)
    }
}

extension PlayerModel {
    public final class Public: Content {
        let id: UUID?
        let name: String
        let user: ProfileModel.Public
        let teamId: TeamModel.IDValue?
        let locations: [LocationModel.Public]

        public init(id: UUID?,
                    name: String,
                    user: ProfileModel,
                    team: TeamModel? = nil,
                    locations: [LocationModel] = []) {
            self.id = id
            self.name = name
            self.user = user.toPublic()
            self.teamId = team?.id
            self.locations = locations.suffix(5).toPublic()
        }
    }
}

extension PlayerModel {
    public static let schema = "players"
    public static var space: String? { Application.spaceSpec }

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let name: FieldKey = "name"
        static let userId: FieldKey = "user_id"
        static let teamId: FieldKey = "team_id"
        static let locations: FieldKey = "locations"

        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let deletedAt: FieldKey = "deleted_at"
    }

    enum ValidationKeys {
        static let id: BasicCodingKey = "id"
        static let name: BasicCodingKey = "name"
        static let userId: BasicCodingKey = "user_id"
        static let teamId: BasicCodingKey = "teamId"
    }
}

extension Collection where Element: PlayerModel {
    public func toPublic() -> [PlayerModel.Public] {
        return self.map { $0.toPublic() }
    }
    
    public func toResponse() -> [PlayerResponse] {
        return self.map { $0.toResponse() }
    }
}
