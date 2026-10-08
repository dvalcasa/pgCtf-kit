
@_exported import pgCtfKit
import Vapor

extension CreateGameRequest: Content {}

extension CreateGameRequest {
    public func toModel() -> GameModel {
        .init(name: name,
              scoringType: scoringType,
              startAt: startAt,
              endAt: endAt,
              cylinderMapID: cylinderMapID,
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
