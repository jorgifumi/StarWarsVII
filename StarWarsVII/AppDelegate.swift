//
//  AppDelegate.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 19/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        tddPaPobres()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func tddPaPobres(){
        
        
        if let image = UIImage(named: "vader.jpg"),
            soundFileURL = NSBundle.mainBundle().URLForResource("vader", withExtension: "caf"),
        soundFile = NSData(contentsOfURL: soundFileURL),
        wikiURL = NSURL(string: "https://en.wikipedia.org/wiki/Darth_Vader")
        {
        
            let vader = ForceSensitive(sithWithFirstName: "Anakin", lastName: "SkyWalker", alias: "Darth Vader", soundData: soundFile, photo: image, url: wikiURL, midichlorians: 15_000)
            print(vader)
        }
        
        // Probar parseado de JSON e inicialización de objetos del modelo
        
        do{
            if let url = NSBundle.mainBundle().URLForResource("regularCharacters.json"),
                data = NSData(contentsOfURL: url),
                characters = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                    
                    // Ver un JSONObjet que este dentro del JSONArray
                    let jabbaJSON = characters[4]
                    do{
                        let strictJabba = try decode(starWarsCharacter: jabbaJSON)
                        let jabba = StarWarsCharacter(strictStarWarsCharacter: strictJabba)
                        print("El vestido más bonito de Leia, se lo regaló \(jabba)")

                    }catch{
                        print("La cagamos al extraer a Jabba")
                    }
                    
                    // Crear mi universo de Star Wars a partir del array que ya tengo
                    let strictChars = decode(starWarsCharacters: characters)
                    print(strictChars)
                    
                    
//                    let u = StarWarsUniverse(arrayOfCharacters: strictChars)
//                    print(u)
                }
        }catch{
            print("La cagamosal parsear el JSON")
        }
        
    }

}
