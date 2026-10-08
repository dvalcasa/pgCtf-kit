 
@_exported import pgCtfKit
import Vapor

extension UpdateGameRequest: Content {}

extension UpdateGameRequest: Validatable {
    public static func validations(_ validations: inout Validations) {
        validations
            .add(
                GameModel.ValidationKeys.startAt,
                as: String.self,
                is: .stringISO8601Date,
                required: false
            )
        
        validations
            .add(
                GameModel.ValidationKeys.endAt,
                as: String.self,
                is: .stringISO8601Date,
                required: false
            )
    }
}

extension ValidatorResults {
    /// Represents the result of a validator that checks if a string is a valid zip code.
    public struct StringISO8601Date {
        /// Indicates whether the input is a valid string  formatted ISO8601 date.
        public let isValidStringISO8601Date: Bool
    }
}

extension ValidatorResults.StringISO8601Date: ValidatorResult {
    public var isFailure: Bool {
        !self.isValidStringISO8601Date
    }
    
    public var successDescription: String? {
        "is a valid string formatted ISO8601 date"
    }
    
    public var failureDescription: String? {
        "is not a valid string formatted ISO8601 date"
    }
}

extension Validator where T == String {
    private static var stringISO8601DateRegex: String {
        "^([\\+-]?\\d{4}(?!\\d{2}\\b))((-?)((0[1-9]|1[0-2])(\\3([12]\\d|0[1-9]|3[01]))?|W([0-4]\\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\\d|[12]\\d{2}|3([0-5]\\d|6[1-6])))([T\\s]((([01]\\d|2[0-3])((:?)[0-5]\\d)?|24\\:?00)([\\.,]\\d+(?!:))?)?(\\17[0-5]\\d([\\.,]\\d+)?)?([zZ]|([\\+-])([01]\\d|2[0-3]):?([0-5]\\d)?)?)?)?$"
    }
    
    public static var stringISO8601Date: Validator<T> {
        Validator { input -> ValidatorResult in
            guard
                let range = input.range(of: stringISO8601DateRegex, options: [.regularExpression]),
                range.lowerBound == input.startIndex && range.upperBound == input.endIndex
                    else {
                return ValidatorResults.StringISO8601Date(isValidStringISO8601Date: false)
            }
            return ValidatorResults.StringISO8601Date(isValidStringISO8601Date: true)
        }
    }
}
