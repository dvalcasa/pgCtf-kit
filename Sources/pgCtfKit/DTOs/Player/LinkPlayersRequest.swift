//
//  LinkPlayersRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 14/04/2026.
//

import Foundation

public struct LinkPlayersRequest: Codable {
    public let players: [UUID]
    
    public init(players: [UUID]) {
        self.players = players
    }
}
