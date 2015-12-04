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
//typealias StarWarsCharacterPack = (firstName: String?, lastName: String?, alias: String?, photo: UIImage, url: NSURL, affiliation: StarWarsAffiliation, soundData: NSData)
//typealias ForceSensitivePack = (starWarsCharacter: StarWarsCharacterPack, midichlorians: Int)

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


func decode(starWarsCharacters json: JSONArray) -> [StrictStarWarsCharacter]{
    
    // Inicializamos
    
    
    do{
        // Recorremos todos los personajes y los vamos guardando en el array
        return try json.map({try decode(starWarsCharacter: $0)})
//        for each in json {
//            result.append(try decode(starWarsCharacter: each))
//        }
    }catch{
        fatalError("Ahora sí que la has cagado")
    }
    // Devuelvo el array
    //return result
}

func decode(forceSensitives json: JSONArray) -> [StrictForceSensitive]{
    
    do{
        // Recorremos todos los personajes y los vamos guardando en el array
        return try json.map({try decode(forceSensitive: $0)})
   
    }catch{
        fatalError("Ahora sí que la has cagado")
    }
}

// Función que extrae el JSON de personajes mindunguis y devuelve un Array de su representación estricta
func decodeJSON() -> [StrictStarWarsCharacter]{
    // Preparo el modelo
    var decoded = [StrictStarWarsCharacter]()
    do{
        if let url = NSBundle.mainBundle().URLForResource("regularCharacters.json"),
            data = NSData(contentsOfURL: url),
            jsons = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                decoded = decode(starWarsCharacters: jsons)
        }
    }catch{
        fatalError("El modelo se fue al carajo")
    }
    return decoded
}

// Función que extrae el JSON de personajes sensibles a la fuerza y devuelve un Array de su representación estricta
func decodeJSON() -> [StrictForceSensitive]{
    // Preparo el modelo
    var decoded = [StrictForceSensitive]()
    do{
        if let url1 = NSBundle.mainBundle().URLForResource("forceSensitives.json"),
            url2 = NSBundle.mainBundle().URLForResource("regularCharacters.json"),
            data1 = NSData(contentsOfURL: url1),
            data2 = NSData(contentsOfURL: url2),
            jsons1 = try NSJSONSerialization.JSONObjectWithData(data1, options: .AllowFragments) as? JSONArray,
            jsons2 = try NSJSONSerialization.JSONObjectWithData(data2, options: .AllowFragments) as? JSONArray{
                decoded = decode(forceSensitives: jsons1)
                let decoded2 = decode(starWarsCharacters: jsons2)
                decoded2.map({decoded.append(StrictForceSensitive(character: $0, midichlorians: 0))})
            }
    }catch{
        fatalError("El modelo se fue al carajo")
    }
    return decoded
}


//MARK: - Initialization

extension StarWarsCharacter{
    // Un init que acepta los parámetros empaquetados en un StrictStarWarsCharacter
    
    convenience init(strictStarWarsCharacter c: StrictStarWarsCharacter){
        self.init(firstName: c.firstName,
            lastName: c.lastName,
            alias: c.alias,
            soundData: c.soundData,
            photo: c.photo,
            url: c.url,
            affiliation: c.affiliation)
    }
}

extension ForceSensitive{
    // Un init que acepta los parámetros empaquetados en un StrictForceSensitive
    
    convenience init(strictForceSensitive c: StrictForceSensitive){
        self.init(firstName: c.character.firstName,
            lastName: c.character.lastName,
            alias: c.character.alias,
            soundData: c.character.soundData,
            photo: c.character.photo,
            url: c.character.url,
            affiliation: c.character.affiliation,
            midichlorians: c.midichlorians)
    }
}

extension StarWarsUniverse{
    // Init de conveniencia
    
    convenience init(arrayOfStrictSWCharacters cs: [StrictForceSensitive]){
        let chars = cs.map({ForceSensitive(strictForceSensitive: $0)})
        // Patearse el array
//        var chars = [StarWarsCharacter]()
//        for each in cs{
//            // Pa cada uno que encuentre lo transformo en un personaje
//            let c = StarWarsCharacter(strictStarWarsCharacter: each)
//            // Lo encasqueto en un array
//            chars.append(c)
//        }
        // Le paso el array y el marron a mi init designado (Paco)
        self.init(arrayOfCharacters: chars)
    }
}
