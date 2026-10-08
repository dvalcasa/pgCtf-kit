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
}

extension GameModel {
    public static let schema = "games"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let name: FieldKey = "name"
        public static let startAt: FieldKey = "start_at"
        public static let endAt: FieldKey = "end_at"
        public static let scoringType: FieldKey = "scoring_type"
        public static let cylinderMapId: FieldKey = "cylinder_map_id"
        public static let status: FieldKey = "status"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }

    public enum ValidationKeys {
        public static let id: BasicCodingKey = "id"
        public static let name: BasicCodingKey = "name"
        public static let startAt: BasicCodingKey = "startAt"
        public static let endAt: BasicCodingKey = "endAt"
        public static let scoringType: BasicCodingKey = "scoringType"
        public static let cylinderMapId: BasicCodingKey = "cylinderMapId"
        public static let status: BasicCodingKey = "status"
    }
}

extension GameModel {
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

extension Collection where Element: GameModel {
    public func toCollection() throws -> [Game] {
        return try self.map { try $0.toDTO() }
    }
}

extension Game.Status {
    public static let schema = "game_status"
    public static var space: String? { Application.spaceSpec }
}
