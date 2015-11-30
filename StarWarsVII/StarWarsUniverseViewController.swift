//
//  StarWarsUniverseViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 27/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class StarWarsUniverseViewController: UITableViewController {
    
    
    var model : StarWarsUniverse?
    // Función que extrae el JSON de personajes mindunguis y devuelve un [Array de su representación estricta
    private func decodeJSON() -> [StrictStarWarsCharacter]?{
        
        var result : [StrictStarWarsCharacter]? = nil
        // Obtener la url del fichero (puede salir mal)
        do{
            if let url = NSBundle.mainBundle().URLForResource("regularCharacters.json"),
                // Leemos el fichero JSON a un NSDATA (puede salir mal)
                data = NSData(contentsOfURL: url),
                // Lo parseamos
                charsArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray{
                    
                    // Todo es fabuloso!!!
                    result = decode(starWarsCharacters: charsArray)
                    
            }
        }catch{
            // Error al parsear el JSON
            print("La cagamos, en vez de un JSON, me mandaron un camisón del Dávalos")
        }
        
        return result
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creamos nuestro modelo
        if let chars = decodeJSON(){
            model = StarWarsUniverse(characters: chars)
        }else{
            fatalError("Se jodió el invento, no hubo forma de parsear los personajes")
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
