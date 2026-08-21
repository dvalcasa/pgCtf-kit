 
import Foundation

public struct UpdateGameRequest {
    let name: String?
    let scoringType: ScoringType?
    let cylinderMapId: UUID?
    let startAt: String?
    let endAt: String?
    let status: Game.Status?
    
    init(name: String? = nil,
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
