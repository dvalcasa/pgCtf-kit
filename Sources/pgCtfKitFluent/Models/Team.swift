import Fluent
import Vapor
import pgCtfKit

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
public final class TeamModel: Model, @unchecked Sendable {
    
    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.name)
    public var name: String

    @Field(key: FieldKeys.color)
    public var color: Int
    
    @Field(key: FieldKeys.score)
    public var score: Int
    
    @Field(key: FieldKeys.nbPlayersMax)
    public var nbPlayersMax: Int

    @Parent(key: FieldKeys.gameId)
    public var game: GameModel

    @Children(for: \.$team)
    public var players: [PlayerModel]

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?
            
    @Timestamp(key: FieldKeys.deletedAt, on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil,
                name: String,
                color: Int,
                score: Int = 0,
                nbPlayersMax: Int = 1,
                gameID: GameModel.IDValue) {
        self.id = id
        self.name = name
        self.color = color
        self.score = score
        self.nbPlayersMax = nbPlayersMax
        self.$game.id = gameID
    }
    
    public func toDTO() throws -> Team {
        .init(
            id: try requireID(),
            name: name,
            color: color,
            nbPlayersMax: nbPlayersMax,
            players: try players.map { try $0.toDTO() },
            game: try game.toDTO()
        )
    }
}

extension TeamModel {
    public static let schema = "teams"
    public static var space: String? { Application.spaceSpec }

    public enum FieldKeys {
        public static let id: FieldKey = "id"
        public static let name: FieldKey = "name"
        public static let color: FieldKey = "color"
        public static let score: FieldKey = "score"
        public static let nbPlayersMax: FieldKey = "nb_players_max"
        public static let gameId: FieldKey = "game_id"

        public static let createdAt: FieldKey = "created_at"
        public static let updatedAt: FieldKey = "updated_at"
        public static let deletedAt: FieldKey = "deleted_at"
    }
    
    public enum ValidationKeys {
        public static let name: BasicCodingKey = "name"
        public static let color: BasicCodingKey = "color"
        public static let score: BasicCodingKey = "score"
        public static let nbPlayersMax: BasicCodingKey = "nbPlayersMax"
        public static let gameId: BasicCodingKey = "gameId"
    }
}

extension TeamModel {
    public final class Public: Content {
        public let id: UUID?
        public let name: String
        public let color: Int
        public  let score: Int
        public let nbPlayersMax: Int?
        public let gameId: GameModel.IDValue?
        public let players: [PlayerModel.Public]

        init(id: UUID?,
             name: String,
             color: Int,
             score: Int,
             game: GameModel,
             nbPlayersMax: Int? = nil,
             players: [PlayerModel] = []) {
            self.id = id
            self.name = name
            self.color = color
            self.score = score
            self.nbPlayersMax = nbPlayersMax
            self.gameId = game.id
            self.players = players.toPublic()
        }
    }
}

extension TeamModel {
    public func toPublic() -> TeamModel.Public {
        .init(id: id,
              name: name,
              color: color,
              score: score,
              game: game,
              nbPlayersMax: nbPlayersMax,
              players: players)
    }
    
    public func toResponse() -> TeamResponse {
        .init(id: id,
              name: name,
              color: color,
              score: score,
              gameID: $game.id,
              nbPlayersMax: nbPlayersMax)
    }
}

extension Collection where Element: TeamModel {
    public func toPublic() -> [TeamModel.Public] {
        return self.map { $0.toPublic() }
    }
}
