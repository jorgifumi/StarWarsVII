//
//  SWWebViewController.swift
//  StarWarsVII
//
//  Created by Jorge Miguel Lucena Pino on 2/12/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class SWWebViewController: UIViewController {

    @IBOutlet weak var wikiWeb: UIWebView!

    var url : NSURL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url {
            let req : NSURLRequest? = NSURLRequest(URL: url)
            wikiWeb.loadRequest(req!)
        }
        
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
