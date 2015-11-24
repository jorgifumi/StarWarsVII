//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//: Opcionales: una caja ande guardar un nil

// Creo una caja para guardar cadenas
var cajaDeTexto : String?

// Meto cosas en la caja
cajaDeTexto = "hola"
print(cajaDeTexto)
cajaDeTexto = nil
print(cajaDeTexto)

// Cómo saber si la caja está vacía
if cajaDeTexto == nil{
    print("No metas la mano!")
}

// Abrir la caja de forma segura, swift asigna el valor que hay dentro de la caja, solo si hay algo dentro, y si no hay nada no entra en el if
if let cajaDeTexto = cajaDeTexto{
    print("lo que había dentro era \(cajaDeTexto)")
}

// Abrir la caja de forma segura en plan finolis (Optional chaining)
cajaDeTexto = "No metas la mano!"
cajaDeTexto?.hasPrefix("No")


// Abrir la caja por cojones (Chuck Norris mode)
print(cajaDeTexto!)


// If desempaquetando varias cosas
let url : String? = "http://www.keepcoding.iorl"

if let urlString = url,
    realURL = NSURL(string: urlString){
    
        // Sé por narices, que urlString y realURL tienen valores no nulos
        
}


//: Gestión de errores
enum ExampleErrors : ErrorType{
    case InvalidRange
    case ValueOutOfBounds
    case FileNotFound
}

func foo(n: Int) throws -> Int{
    
    guard n >= 0 else{
        // Lanzo un error
        throw  ExampleErrors.InvalidRange
        
    }
    
    return n * n
}

// try no genera un ámbito donde se puede lanzar un error, como en Java o C++. Solo indica que se llama a una funcion que puede lanzar un error
// try! -> Chuck Norris: me la pelan los errores

try foo(3)

// Capturar errores
do{
    let result = try foo(-4)
}catch ExampleErrors.InvalidRange{
    print("la cagamos")
}catch{
    print("la cagamos, pero de verdad")
}


//: Errores en los inicializadores

class Thing {
    var size : Int = 0
    
    init(size: Int) throws {
        guard size > 0 else{
            throw ExampleErrors.ValueOutOfBounds
        }
        self.size = size
    }
    
}


class Throng {
    
    var size : Int = 0
    
    init?(size: Int){
        
        if size < 0 {
            return nil
        }
        self.size = size
    }
}

//: Moraleja:
//: Para inicializadores, usamos inicializadores fallables (que devuelven nil). Para todo lo demás, do, try, ccatch

//: Cast en Swift

let cosa : AnyObject = "Soy una cadena"

let talvezCadena = cosa as? String      // prudente
print(talvezCadena)

let porCojonesCadena = cosa as! String  // con un par
print(porCojonesCadena)

let talvezInt = cosa as? Int
print(talvezInt)
//let porCojonesInt = cosa as! Int




