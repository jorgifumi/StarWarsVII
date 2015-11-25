//
//  StarWarsUniverse.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 21/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit


// Carta a los Reyes Magos







class StarWarsUniverse{
    
    //MARK: - Private interface
    
    // Guardo los personajes en un diccionario cuyas claves son las afiliaciones y los valores son arrays de StarWarsCharacters
    
    private var characters : [StarWarsAffiliation:[StarWarsCharacter]]

    //MARK: - Initializacion
    
    init(arrayOfCharacters: [StarWarsCharacter]){
        
        // Inicializamos el diccionario vacío
        characters = Dictionary<StarWarsAffiliation, Array<StarWarsCharacter>>()
        for each in StarWarsAffiliation.cases(){
            characters[each] = Array<StarWarsCharacter>()
        }
        // Patearse los personajes, y según su afiliación, los metemos en un sitio o en otro
        for character in arrayOfCharacters{
            
            
            // Según la afiliacion lo metemos en un sitio u otro
            let aff = character.affiliation
            characters[aff]?.append(character)
        }
        
    }
    
        
    //MARK: - Public interface
    
    // total de personajes
    var countCharacters: Int{
        get{
            // Patearse el diccionario e ir sumando la cantidad de personajes en cada uno
            var total = 0
            for affiliation in StarWarsAffiliation.cases(){
                total = total + countCharacters(affiliation)
            }
            return total
        }
    }
    
    var countAffiliations: Int{
        
        // El total de las afiliaciones
        get{
            // todo
            return StarWarsAffiliation.countAffiliations()
        }
    }
    
    // Total de personajes para cada afiliación
    func countCharacters(inAffiliation: StarWarsAffiliation) -> Int{
        // Obtengo el array de la afiliación y le pregunto cual es su tamaño
        if let chars = characters[inAffiliation] {
            return chars.count
        }
        return 0
        
    }
    
    // El nombre de una afiliacion
    func affiliationName(atIndex: Int) -> String{
        
        // todo: averiguar por qué no deja indexar las keys directamente
        
        // deberes:
        // a) asegurarse que el array está siempre ordenado
        // b) Lanzar un error si el índice está fuera de rango
        let affiliations = Array(characters.keys)
        let aff = affiliations[atIndex]
        
        return StarWarsAffiliation.nameOfAffiliation(aff)
    }
    
    // El personaje n de la afiliacion m
    subscript(idx: Int, inAffiliation aff: StarWarsAffiliation) -> StarWarsCharacter?{
        // Obtener el array de la afiliación
        // el personaje en la posición
        get{
            if let chars = characters[aff]{
                return chars[idx]
            }
            return nil
        }
    }
}
