//
//  PurchaseViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/23/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {


    @IBOutlet var panToClose: InteractivePanToClose!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panToClose.setRecognizer()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
