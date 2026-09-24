
import Foundation

public struct CreateTeamRequest: Encodable {
    public let name: String
    public let score: Int?
    public let color: Int
    public let nbPlayersMax: Int
    public let gameId: UUID
    
    public init(name: String,
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
