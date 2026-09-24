
public struct UpdateTeamRequest: Encodable {
    public let name: String?
    public let color: Int?
    public let score: Int?
    public let nbPlayersMax: Int?
    
    public init(name: String? = nil,
                color: Int? = nil,
                score: Int? = nil,
                nbPlayersMax: Int? = nil) {
        self.name = name
        self.color = color
        self.score = score
        self.nbPlayersMax = nbPlayersMax
    }
}
