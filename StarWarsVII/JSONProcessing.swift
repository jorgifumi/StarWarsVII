//
//  JSONProcessing.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 20/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

/*
{
"firstName"    : null,
"lastName"     : null,
"alias"        : "C-3PO",
"soundFile"    : "c3po.caf",
"imageFile"    : "c3po.jpg",
"affiliation"  : "Rebel Alliance",
"url"          : "https://en.wikipedia.org/wiki/C-3PO",
}
*/

//MARK: - Claves
enum JSONKeys: String{
    case firstName = "firstName"
    case lastName = "lastName"
    case alias = "alias"
    case soundFile = "soundFile"
    case imageFile = "imageFile"
    case affiliation = "affiliation"
    case url = "url"
    case midichlorians = "midichlorians"
}

//MARK: - Aliases
typealias JSONObject        = AnyObject
typealias JSONDictionary    = [String:JSONObject]
typealias JSONArray         = [JSONDictionary]

//MARK: - Packs
typealias StarWarsCharacterPack = (firstName: String?, lastName: String?, alias: String?, photo: UIImage, url: NSURL, affiliation: StarWarsAffiliation, soundData: NSData)
typealias ForceSensitivePack = (starWarsCharacter: StarWarsCharacterPack, midichlorians: Int)

//MARK: - Errors
enum JSONProcessingError : ErrorType{
    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat
}

//MARK - Structs
struct StrictStarWarsCharacter{
    
    let firstName   : String?
    let lastName    : String?
    let alias       : String?
    let photo       : UIImage
    let url         : NSURL
    let affiliation : StarWarsAffiliation
    let soundData   : NSData
}

struct StrictForceSensitive {
    
    let character: StrictStarWarsCharacter
    let midichlorians: Int
}

//MARK: - Decoding
func decode(starWarsCharacter json: JSONDictionary) throws -> StrictStarWarsCharacter{
    
    // Nos metemos en el mundo imaginario de Yupi donde todo funciona y nada es nil
    guard let urlString = json[JSONKeys.url.rawValue] as? String,
        url = NSURL(string: urlString) else{
            throw JSONProcessingError.WrongURLFormatForJSONResource
        
    }
    
    guard let imageName = json[JSONKeys.imageFile.rawValue] as? String,
        image = UIImage(named: imageName) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }
    
    guard let soundName = json[JSONKeys.soundFile.rawValue] as? String,
        soundURL = NSBundle.mainBundle().URLForResource(soundName),
        soundData = NSData(contentsOfURL: soundURL) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }
    
    guard let affiliationName = json[JSONKeys.affiliation.rawValue] as? String
        else{
            throw JSONProcessingError.WrongJSONFormat
    }
    
    // Estamos en el mundo de Yupi: todo es fabuloso.
    let firstName   = json[JSONKeys.firstName.rawValue] as? String
    let lastName    = json[JSONKeys.lastName.rawValue] as? String
    let alias       = json[JSONKeys.alias.rawValue] as? String
    
    let affiliation = StarWarsAffiliation.byName(affiliationName)
    
    // Joé pues crear el StarWarsCharacter
    return StrictStarWarsCharacter(firstName: firstName,
        lastName: lastName,
        alias: alias,
        photo: image,
        url: url,
        affiliation: affiliation,
        soundData: soundData)
}


func decode(forceSensitive json: JSONDictionary) throws -> StrictForceSensitive{
    
    
    
    guard let midichlorians = json[JSONKeys.midichlorians.rawValue] as? Int
        else{
            throw JSONProcessingError.WrongJSONFormat
    }

    return StrictForceSensitive(character: try decode(starWarsCharacter: json), midichlorians: midichlorians)
    
}







