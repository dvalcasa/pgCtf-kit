
public struct UpdateTeamRequest {
    let name: String?
    let color: Int?
    let score: Int?
    let nbPlayersMax: Int?
    
    init(name: String? = nil,
         color: Int? = nil,
         score: Int? = nil,
         nbPlayersMax: Int? = nil) {
        self.name = name
        self.color = color
        self.score = score
        self.nbPlayersMax = nbPlayersMax
    }
}
