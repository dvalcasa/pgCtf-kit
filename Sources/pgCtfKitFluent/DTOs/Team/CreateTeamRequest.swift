
import pgCtfKit
import Vapor

extension CreateTeamRequest: Content {}

extension CreateTeamRequest {
    public func toModel() -> TeamModel {
        .init(name: name,
              color: color,
              nbPlayersMax: nbPlayersMax,
              gameID: gameID)
    }
}
