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
    
    //MARK: - Initializacion
    
    //MARK: - Private interface
    
    //MARK: - Public interface
    
    // total de personajes
    var countCharacters: Int{
        get{
            // todo
            return 42
        }
    }
    
    var countAffiliations: Int{
        
        // El total de las afiliaciones
        get{
            // todo
            return 42
        }
    }
    
    // Total de personajes para cada afiliación
    func countCharacters(inAffiliation: StarWarsAffiliation) -> Int{
        // todo
        return 42
    }
    
    // El nombre de una afiliacion
    func affiliationName(atIndex: Int) -> String{
        
        // todo
        return "The Hitchhikers' guide to the Galaxy"
    }
    
    // El personaje n de la afiliacion m
//    subscript(idx: Int, inAffiliation aff: StarWarsAffiliation) -> StarWarsCharacter{
//        // todo
//        
//    }
}
