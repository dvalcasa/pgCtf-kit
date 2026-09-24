 
import Foundation

public struct UpdateGameRequest: Encodable {
    public let name: String?
    public let scoringType: ScoringType?
    public let cylinderMapId: UUID?
    public let startAt: String?
    public let endAt: String?
    public let status: Game.Status?
    
    public init(name: String? = nil,
                scoringType: ScoringType? = nil,
                cylinderMapId: UUID? = nil,
                startAt: String? = nil,
                endAt: String? = nil,
                status: Game.Status? = nil) {
        self.name = name
        self.scoringType = scoringType
        self.cylinderMapId = cylinderMapId
        self.startAt = startAt
        self.endAt = endAt
        self.status = status
    }
}
