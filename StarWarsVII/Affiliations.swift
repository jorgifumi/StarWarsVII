//
//  Affiliations.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 19/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

enum StarWarsAffiliation:Int{
    
    case GalacticEmpire = 0
    case RebelAlliance = 1
    case JabbaCriminalEmpire = 2
    case FirstOrder = 3
    case Unknown = 4
    
    
    static func cases() -> [StarWarsAffiliation]{
        return [.GalacticEmpire, .RebelAlliance, .JabbaCriminalEmpire, .FirstOrder, .Unknown]
    }
    
    static func countAffiliations() -> Int{
        return 5
    }
    
    static func nameOfAffiliation(aff: StarWarsAffiliation)->String{
        
        let name : String
        
        switch aff{
        case .GalacticEmpire:
            name = "Galactic Empire"
            
        case .RebelAlliance:
            name = "Rebel Alliance"
            
        case .JabbaCriminalEmpire:
            name = "Jabba's Criminal Empire"
            
        case .FirstOrder:
            name = "First Order"
            
        case .Unknown:
            name = "Unknown"
        }
        
        return name

    }

    
    static func byRawValue(raw: Int) ->StarWarsAffiliation{
        
        let aff : StarWarsAffiliation
        
        switch raw{
        case StarWarsAffiliation.GalacticEmpire.rawValue:
            aff = .GalacticEmpire
            
        case StarWarsAffiliation.RebelAlliance.rawValue:
            aff = .RebelAlliance
            
        case StarWarsAffiliation.JabbaCriminalEmpire.rawValue:
            aff = .JabbaCriminalEmpire
            
        case StarWarsAffiliation.FirstOrder.rawValue:
            aff = .FirstOrder
            
        case StarWarsAffiliation.Unknown.rawValue:
            aff = .Unknown
            
        default:
            aff = .Unknown
        }
        
        return aff
    }
    
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