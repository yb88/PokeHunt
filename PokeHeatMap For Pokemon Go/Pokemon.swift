//
//  Pokemon.swift
//  PokeHeatMap For Pokemon Go
//
//  Created by youcef bouhafna on 7/23/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class Pokemon {
    private let KName = "name"
    private let KId = "id"
    private let KBaseExperience = "base_expereince"
    private let KHeight = "height"
    private let KWeight = "weight"
    private let KTypes = "types"
    private let KMoves = "moves"
    private let KStats = "stats"
    private let KBaseStats = "base_stat"
    let owner: String
    let name: String
    let id: Int
    let baseExperience: Int
    let height: Int
    let weight: Int
    var types: [String]
    var moves: [String]
    var stats: [String] 
    var baseStats: [String]
    
    var identifier: String?
    var endpoint: String {
        return "pokemons"
    }
    var jsonValue: [String: AnyObject] {
        
    }
    
     init?(jsonDictionary: [String: AnyObject]) {
        guard let name = jsonDictionary[KName] as? String else {return nil}
        self.name = name
        self.id = jsonDictionary[KId] as? Int ?? 0
        self.baseExperience = jsonDictionary[KBaseExperience] as? Int ?? 0
        self.height = jsonDictionary[KHeight] as? Int ?? 0
        self.weight = jsonDictionary[KWeight] as? Int ?? 0
        
        guard let typesArray = jsonDictionary[KTypes] as? [[String: AnyObject]] else { return nil}
        self.types = []
        for typeDictionary in typesArray {
            guard let singleTypeDictionary = typeDictionary["type"] as? [String: AnyObject] else { return nil }
            guard let type = singleTypeDictionary["name"] as? String else {return nil}
            self.types.append(type)
        }
        guard let movesArray = jsonDictionary["moves"] as? [[String: AnyObject]] else {return nil}
        self.moves = []
        for moveDictionary in movesArray {
            guard let singleMoveDictionary = moveDictionary["move"] as? [String: AnyObject] else { return}
            guard let move = singleMoveDictionary["name"] as? String else { return nil}
            self.moves.append(move)
            
        }
        guard let statsArray = jsonDictionary["stats"] as? [[String: AnyObject]] else {return nil }
        self.stats = []
        for statDictionary in statsArray {
            guard let singleStatDictionary = statDictionary["stat"] as? [String: AnyObject] else { return nil }
            guard let stat = singleStatDictionary["name"] as? String else { return nil }
            self.stats.append(stat)
        }
        guard let baseStatsArray = jsonDictionary["stats"] as? [[String: AnyObject]] else { return nil}
        self.baseStats = []
        for baseStatDictionary in baseStatsArray {
             let base_stat = baseStatDictionary["base_stat"] as? Int ?? 0
            self.baseStats.append("\(base_stat)")
        }
    }
}
