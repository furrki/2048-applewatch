//
//  Game.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import Foundation

class Game: ObservableObject {
    
    weak var delegate: GameDelegate?
    
    var score = 0 {
        didSet {
            self.delegate?.game(score)
        }
    }
    
    var prevScore = 0
    
    @Published var table = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var prevTable = [Int]()
    
    init() {
        table = (1...16).map({ (i) -> Int in
            return 0
        })
        
        generateRandom()
        prevTable = table
    }
    
    func reset() {
        score = 0
        prevScore = 0
        table = (1...16).map({ (i) -> Int in
             return 0
         })
         
         generateRandom()
         prevTable = table
    }
    
    func generateRandom() {
        let availableIndexes = table.indexes(of: 0)
        if availableIndexes.count > 0 {
            let selected = availableIndexes.randomElement()!
            table[selected] = 2
            delegate?.game(changed: [selected])
        }
    }
    
    func back() {
        if table != prevTable {
            table = prevTable
            score = prevScore
            delegate?.game(table)
            saveTable()
        }
    }
    
    func doMove(move: Move) {
        let lastTable = self.table
        
        var colTable: [[Int]] {
            get {
                return self.table.chunked(into: 4)
                
            }
            set {
                self.table = newValue.flatMap({ (col) -> [Int] in
                    return col
                })
            }
        }
        var rowTable: [[Int]] {
            get {
                return self.table.chunked(into: 4).transposed()
                
            }
            set {
                self.table = newValue.transposed().flatMap({ (col) -> [Int] in
                    return col
                })
            }
        }
        
        
        if move == .Left {
            for i in 0...3 {
                colTable[i] = moveLeft(col: colTable[i])
            }
        } else if move == .Right {
            for i in 0...3 {
                colTable[i] = moveRight(col: colTable[i])
            }
        } else if move == .Up {
            for i in 0...3 {
                rowTable[i] = moveUp(row: rowTable[i])
            }
        } else if move == .Down {
            for i in 0...3 {
                rowTable[i] = moveDown(row: rowTable[i])
            }
        }
        
        if lastTable == table {
            
        } else {
            var dIndexes = [Int]()
            for i in 0..<table.count {
                if table[i] != lastTable[i] {
                    dIndexes.append(i)
                }
            }
            delegate?.game(changed: dIndexes)
            prevTable = lastTable
            
            generateRandom()
            saveTable()
        }
    }
    
    func moveLeft(col: [Int]) -> [Int]{
        var newCol = [0, 0, 0, 0]
        var j = 0
        var previous: Int? = nil
        for i in 0..<col.count {
            if col[i] != 0 {
                if previous == nil {
                    previous = col[i]
                } else {
                    if previous == col[i] {
                        newCol[j] = 2 * col[i]
                        prevScore = score
                        score += newCol[j]
                        previous = nil
                    } else {
                        newCol[j] = previous!
                        previous = col[i]
                    }
                    j += 1
                }
            }
        }
        if previous != nil {
            newCol[j] = previous!
        }
        return newCol
    }
    
    func moveRight(col: [Int]) -> [Int]{
        var newCol = [0, 0, 0, 0]
        var j = 3
        var previous: Int? = nil
        for i in (0..<(col.count)).reversed() {
            if col[i] != 0 {
                if previous == nil {
                    previous = col[i]
                } else {
                    if previous == col[i] {
                        newCol[j] = 2 * col[i]
                        prevScore = score
                        score += newCol[j]
                        previous = nil
                    } else {
                        newCol[j] = previous!
                        previous = col[i]
                    }
                    j -= 1
                }
            }
        }
        if previous != nil {
            newCol[j] = previous!
        }
        return newCol
    }
    
    func moveUp(row: [Int]) -> [Int]{
        return moveLeft(col:  row)
    }
    
    func moveDown(row: [Int]) -> [Int]{
        return moveRight(col:  row)
    }
    
    func saveTable() {
        let defaults = UserDefaults.standard
        defaults.set(table, forKey: "GameTable")
        defaults.set(prevTable, forKey: "PrevGameTable")
        defaults.synchronize()
    }
    
    func loadTable() {
        let defaults = UserDefaults.standard
        table = defaults.array(forKey: "GameTable")  as? [Int] ?? [Int]()
        prevTable = defaults.array(forKey: "PrevGameTable")  as? [Int] ?? [Int]()
    }
}

enum Move {
    case Up, Down, Left, Right
}

protocol GameDelegate: class {
    func game(changed cells: [Int])
    func game(_ tableChanged: [Int])
    func game(_ scoreUpdated: Int)
}
