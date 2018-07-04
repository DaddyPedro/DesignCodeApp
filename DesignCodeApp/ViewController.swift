//
//  ViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/2/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        alphaAnimation(dutation: 3)

    }
    
    
    
    
    //Mark: - Alpha animation
    func alphaAnimation(dutation: Double) {
        
        titleView.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        
        UIView.animate(withDuration: dutation) {
            self.titleView.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
    }
    
    
    
    // Mark: - Play button tapped
    @IBAction func playButtonTapped(_ sender: Any) {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        let url = URL(string: urlString)
        
        let player = AVPlayer(url: url!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
        
    }
    
    

}

