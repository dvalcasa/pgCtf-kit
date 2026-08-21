
import Foundation

public struct CreateTeamRequest {
    let name: String
    let score: Int?
    let color: Int
    let nbPlayersMax: Int
    let gameId: UUID
    
    init(name: String,
         score: Int?,
         color: Int,
         nbPlayersMax: Int = 1,
         gameId: UUID) {
        self.name = name
        self.score = score
        self.color = color
        self.nbPlayersMax = nbPlayersMax
        self.gameId = gameId
    }
}
