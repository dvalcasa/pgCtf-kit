import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class GameModel: Model, @unchecked Sendable {

    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.name)
    public var name: String

    @Enum(key: FieldKeys.scoringType)
    public var scoringType: ScoringType
    
    @Field(key: FieldKeys.startAt)
    public var startAt: Date

    @Field(key: FieldKeys.endAt)
    public var endAt: Date

    @OptionalParent(key: FieldKeys.cylinderMapId)
    public var cylinderMap: CylinderMapModel?
    
    @Children(for: \.$game)
    public var teams: [TeamModel]
    
    @Field(key: FieldKeys.status)
    public var status: Game.Status

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?

    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil,
                name: String,
                scoringType: ScoringType,
                startAt: Date,
                endAt: Date,
                cylinderMapID: CylinderMapModel.IDValue?,
                status: Game.Status) {
        self.id = id
        self.name = name
        self.scoringType = scoringType
        self.startAt = startAt
        self.endAt = endAt
        self.$cylinderMap.id = cylinderMapID
        self.status = status
    }
    
    public func toDTO() throws -> Game {
        .init(
            id: try requireID(),
            name: name,
            cylinderMap: try cylinderMap?.toDTO(),
            startAt: startAt,
            endAt: endAt,
            scoringType: scoringType,
            teams: try teams.map { try $0.toDTO() },
            status: status
        )
    }
}

extension GameModel {
    public static let schema = "games"
    public static var space: String? { Application.spaceSpec }

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let name: FieldKey = "name"
        static let startAt: FieldKey = "start_at"
        static let endAt: FieldKey = "end_at"
        static let scoringType: FieldKey = "scoring_type"
        static let cylinderMapId: FieldKey = "cylinder_map_id"
        static let status: FieldKey = "status"

        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let deletedAt: FieldKey = "deleted_at"
    }

    enum ValidationKeys {
        static let id: BasicCodingKey = "id"
        static let name: BasicCodingKey = "name"
        static let startAt: BasicCodingKey = "startAt"
        static let endAt: BasicCodingKey = "endAt"
        static let scoringType: BasicCodingKey = "scoringType"
        static let cylinderMapId: BasicCodingKey = "cylinderMapId"
        static let status: BasicCodingKey = "status"
    }
}

extension GameModel {
    public final class Public: Content {
        let id: UUID?
        let name: String
        let scoringType: ScoringType
        let startAt: String
        let endAt: String
        let cylinderMapID: UUID?
        let teams: [TeamModel.Public]
        let status: Game.Status

        public init(id: UUID? = nil,
             name: String,
             scoringType: ScoringType,
             startAt: Date,
             endAt: Date,
             cylinderMapID: UUID?,
             teams: [TeamModel] = [],
             status: Game.Status) {
            self.id = id
            self.name = name
            self.scoringType = scoringType
            self.startAt = startAt.ISO8601Format()
            self.endAt = endAt.ISO8601Format()
            self.cylinderMapID = cylinderMapID
            self.teams = teams.toPublic()
            self.status = status
        }
    }
}

extension GameModel {
    public func toPublic() -> GameModel.Public {
        .init(id: id,
              name: name,
              scoringType: scoringType,
              startAt: startAt,
              endAt: endAt,
              cylinderMapID: cylinderMap?.id,
              teams: teams,
              status: status)
    }
    
    public func toResponse() -> GameResponse {
        .init(id: id,
              name: name,
              scoringType: scoringType,
              startAt: startAt.ISO8601Format(),
              endAt: endAt.ISO8601Format(),
              cylinderMapID: $cylinderMap.id,
              status: status)
    }
}

extension Collection where Element: GameModel {
    public func toPublic() -> [GameModel.Public] {
        return self.map { $0.toPublic() }
    }
    
    public func toResponse() -> [GameResponse] {
        return self.map { $0.toResponse() }
    }
}

extension Game.Status {
    public static let schema = "game_status"
    public static var space: String? { Application.spaceSpec }
}
