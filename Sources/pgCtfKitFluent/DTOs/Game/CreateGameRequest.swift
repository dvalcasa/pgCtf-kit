
@_exported import pgCtfKit
import Vapor

extension CreateGameRequest: Content {}

extension CreateGameRequest {
    public func toModel() -> Game {
        .init(name: name,
              startAt: startAt,
              endAt: endAt,
              scoringType: scoringType,
              status: status)
    }
}

extension CreateGameRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
        validations.add(
            GameModel.ValidationKeys.scoringType,
            as: String.self,
            is: .in(ScoringType.allCases.map(\.rawValue)),
            customFailureDescription:
                "Scoring type must be among: \(ScoringType.allCases).")
    }
}
