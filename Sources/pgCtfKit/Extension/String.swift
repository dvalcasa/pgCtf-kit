//
//  String.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 10/10/2025.
//

import Foundation

extension String {
    public var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    public func ISO8601FormatToDate() -> Date {
        let dateFormatter = ISO8601DateFormatter()

        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        
        return date
    }
}
