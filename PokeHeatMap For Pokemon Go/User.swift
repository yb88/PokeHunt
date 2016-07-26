//
//  User.swift
//  PokeHeatMap For Pokemon Go
//
//  Created by youcef bouhafna on 7/23/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class User {
    private let KFirstName = "firstName"
    private let KImageURL = "imageURL"
    let firstName: String
    let imageURL: String
    let pokemons: [Pokemon] = []
    let pokemonIDS: [String] = []
    
    // firebase identifier and endpoint
    var identifier: String?
    var endpoint: String {
        return "users"
    }
    
    // json representation of the object that will be saved to firebase
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject]  =  [KFirstName: firstName, KImageURL: imageURL]
        var pokemonIdentifiers: [String] = []
        for pokemon in pokemons {
            if let identifier = pokemon.identifier {
                pokemonIdentifiers.append(identifier)
            }
            
        }
        
        
    }
    init(firstName: String, imageURL: String, identifier: String? = nil, pokemons: [Pokemon] = [], pokemonIDS: [String] = []) {
        self.firstName = firstName
        self.imageURL = imageURL
        self.identifier = identifier
        self.pokemons = pokemons
        self.pokemonIDS = pokemonIDS
    }
    init?(json:[String: AnyObject], identifier: String) {
        guard let firstName = json[KFirstName] as? String,
            let imageURL = json[KImageURL] as? String else {return nil}
        self.firstName = firstName
        self.imageURL = imageURL
        self.identifier = identifier
    }
    
}