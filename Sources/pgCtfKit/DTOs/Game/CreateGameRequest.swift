
import Foundation

public struct CreateGameRequest {
    let name: String
    let scoringType: ScoringType
    let cylinderMapId: UUID?
    let startAt: Date
    let endAt: Date
    let status: Game.Status?
    
    init(name: String,
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
