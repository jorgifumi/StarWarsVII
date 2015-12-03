//
//  StarWarsCharacterViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 30/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit
import AVFoundation

class StarWarsCharacterViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView?
    
    @IBOutlet weak var playAudio: UIBarButtonItem?
    
    
    
    var model : StarWarsCharacter?{
        willSet{
            updateUI()
        }
    }

    func updateUI(){
        // Poner el nombre como title
        self.title = model?.alias
        
        // Mostar la imagen
        if let photo = model?.photo {
            self.photo?.image = photo
        }
        
        // Asignar acción al botón
        playAudio?.action = "playSound"
    }
    
    func playSound(){
        
        if let data = model?.soundData {
            do{
                let audioPlayer: AVAudioPlayer = try AVAudioPlayer(data: data)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch{
                print("Error al crear el reproductor de audio")
            }
            
        }else{
            print("No hay datos para reproducir")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "WikiView"){
            // Get the new view controller using segue.destinationViewController.
            let webVC = segue.destinationViewController as? SWWebViewController
            
            // Pass the selected object to the new view controller.
            webVC!.url = model?.url
            
        }
    

    }
}
