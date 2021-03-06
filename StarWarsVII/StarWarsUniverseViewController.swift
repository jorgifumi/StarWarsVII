//
//  StarWarsUniverseViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 27/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class StarWarsUniverseViewController: UITableViewController {

    
    
    let model : StarWarsUniverse = StarWarsUniverse(arrayOfStrictSWCharacters: decodeJSON())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "StarWars VII"

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
        // Devuelve el número de secciones
        return model.countAffiliations
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Recibe una tabla y el número de sección y devuelve el número de filas en esa sección
        let aff = StarWarsAffiliation.byName(model.affiliationName(section))
        return model.countCharacters(aff)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StarWarsCharacterId", forIndexPath: indexPath)
        
        let character = model[indexPath.row, inAffiliation: StarWarsAffiliation.byName(model.affiliationName(indexPath.section))]
        
        // Configure the cell...
        if let alias = character?.alias {
            cell.textLabel?.text = alias
            cell.detailTextLabel?.text = character?.name
            

        }else{
            cell.textLabel?.text = character?.name
        }
        
        cell.imageView?.image = character?.photo
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.affiliationName(section)
    }

    
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

    
    // MARK: - Navigation

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DetailSWCharacter"){
            // Get the new view controller using segue.destinationViewController.
            let detailVC = segue.destinationViewController as? StarWarsCharacterViewController
            
            // Pass the selected object to the new view controller.
            if let ip = self.tableView.indexPathForSelectedRow {
                let character = model[ip.row, inAffiliation: StarWarsAffiliation.byName(model.affiliationName(ip.section))]
                detailVC!.model = character
            }
            
            
        }
    }
 

}
