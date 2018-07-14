//
//  moreSceneViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/14/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class moreSceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func twitterButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "moreToWeb", sender: "https://twitter.com/mengto")
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "moreToWeb", sender: "https://designcode.io")
        
    }
    @IBAction func communityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "moreToWeb", sender: "https://spectrum.chat/design-code")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreToWeb" {
            let navigationController = segue.destination as! UINavigationController
            let webViewController = navigationController.viewControllers.first as! webViewController
            webViewController.urlString = sender as! String
        }
    }
}
