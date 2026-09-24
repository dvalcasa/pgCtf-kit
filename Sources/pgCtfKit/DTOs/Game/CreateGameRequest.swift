
import Foundation

public struct CreateGameRequest {
    public let name: String
    public let scoringType: ScoringType
    public let cylinderMapId: UUID?
    public let startAt: Date
    public let endAt: Date
    public let status: Game.Status?
    
    public init(name: String,
                scoringType: ScoringType,
                cylinderMapId: UUID?,
                startAt: Date,
                endAt: Date,
                status: Game.Status?) {
        self.name = name
        self.scoringType = scoringType
        self.cylinderMapId = cylinderMapId
        self.startAt = startAt
        self.endAt = endAt
        self.status = status
    }
}
