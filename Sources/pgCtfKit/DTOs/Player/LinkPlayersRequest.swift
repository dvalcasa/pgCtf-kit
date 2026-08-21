//
//  LinkPlayersRequest.swift
//  iPgCtf
//
//  Created by Didier Valcasara on 14/04/2026.
//

import Foundation

public struct LinkPlayersRequest: Codable {
    let players: [UUID]
    
    init(players: [UUID]) {
        self.players = players
    }
}
