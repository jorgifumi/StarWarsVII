//
//  CharacterViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 30/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var model : StarWarsCharacter?{
        willSet{
            print("hola")
            updateUI()
        }
    }
    
    func updateUI(){
        // Poner el nombre como title
        
        // Mostrar la imagen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
