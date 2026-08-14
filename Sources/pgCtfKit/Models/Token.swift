//
//  Token.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 07/02/2025.
//

import Foundation

struct Token: Codable {
    var userId: UUID?
    var token: String
    
    init(token: String) {
        self.token = token
    }
}
