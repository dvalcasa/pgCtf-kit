
import Foundation

public struct CreateGameRequest: Codable, Sendable {
    public let name: String
    public let scoringType: ScoringType
    public let cylinderMapID: UUID?
    public let startAt: Date
    public let endAt: Date
    public let status: Game.Status?
    
    public init(name: String,
                scoringType: ScoringType,
                cylinderMapID: UUID?,
                startAt: Date,
                endAt: Date,
                status: Game.Status?) {
        self.name = name
        self.scoringType = scoringType
        self.cylinderMapID = cylinderMapID
        self.startAt = startAt
        self.endAt = endAt
        self.status = status
    }
}
