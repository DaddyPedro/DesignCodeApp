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
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        alphaAnimation(duration: 3)
        
        
        
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self

    }
    
    
    
    
    //Mark: - Alpha animation
    func alphaAnimation(duration: Double) {
        
        titleView.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        
        UIView.animate(withDuration: duration) {
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath)
        return cell
    }
    
    
}


extension ViewController: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsety = scrollView.contentOffset.y
        if offsety < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsety)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsety/3)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsety/3)
            titleView.transform = CGAffineTransform(translationX: 0, y: -offsety/4)
            homeImageView.transform = CGAffineTransform(translationX: 0, y: -offsety/5)
        }
    }
}

