//
//  StarWarsCharacterViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 30/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView?
    @IBOutlet weak var toolBar: UIToolbar?
    
    var model : StarWarsCharacter?{
        willSet{
            updateUI()
        }
    }

    func updateUI(){
        // Poner el nombre como title
        self.title = model?.alias
        
        // Mostar la imagen
        if let photoR = model?.photo {
            self.photo?.image = photoR
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
