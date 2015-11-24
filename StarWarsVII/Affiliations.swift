//
//  Affiliations.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 19/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

enum StarWarsAffiliation{
    
    case GalacticEmpire
    case RebelAlliance
    case JabbaCriminalEmpire
    case FirstOrder
    case Unknown
    
    
    static func byName(name: String) ->StarWarsAffiliation{
        
        let aff : StarWarsAffiliation
        
        switch name{
        case "Galactic Empire":
            aff = .GalacticEmpire
            
        case "Rebel Alliance":
            aff = .RebelAlliance
            
        case "Jabba's Criminal Empire":
            aff = .JabbaCriminalEmpire
            
        case "First Order":
            aff = .FirstOrder
            
        default:
            aff = .Unknown
        }
        
        return aff
    }
}