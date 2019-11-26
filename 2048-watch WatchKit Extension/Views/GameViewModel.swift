//
//  GameViewModel.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    var game: Game
    
    init(game: Game) {
        self.game = game
        self.game.delegate = self
        self.game.loadTable()
    }
    
    func getForegroundColor(_ i: Int, _ j: Int) -> Color {
        return getColor(for: game.table[i * 4 + j])[1]
    }
    
    func getBackgroundColor(_ i: Int, _ j: Int) -> Color {
        return getColor(for: game.table[i * 4 + j])[0]
    }
    
    func getNumber(_ i: Int, _ j: Int) -> String {
        return "\(game.table[i * 4 + j])"
    }
    
}

extension GameViewModel: GameDelegate {
    func game(changed cells: [Int]) {
        
    }
    
    func game(_ tableChanged: [Int]) {
        
    }
    
    func game(_ scoreUpdated: Int) {
        
    }
}
