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

// Mark: - Cell conformace protocol

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionCollectionViewCell
        let section = sections[indexPath.row]
        cell.cellImageView.image = UIImage(named: section["image"]!)
        cell.cellTitleLabel.text = section["title"]
        cell.cellCaptionLabel.text = section["caption"]
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        
        return cell
    }
    
    
}


extension ViewController: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Mark: - Parallax animation for hero view
        
        let offsety = scrollView.contentOffset.y
        if offsety < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsety)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsety/3)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsety/3)
            titleView.transform = CGAffineTransform(translationX: 0, y: -offsety/4)
            homeImageView.transform = CGAffineTransform(translationX: 0, y: -offsety/5)
        }
        
        if let collectionView = scrollView as? UICollectionView {
            
            // Mark: - Cell background translation using scroll view

            for cell in collectionView.visibleCells as! [SectionCollectionViewCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
               let tranlationX = cellFrame.origin.x/5
                cell.cellImageView.transform = CGAffineTransform(translationX: tranlationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
        }
    }
    

        }
    
    // Mark: - Cell animation function
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        

        let angleFromX = Double(cellFrame.origin.x / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180)
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0/1000
        
        
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200))/1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
            
        }else if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        
        let scale = CATransform3DScale(transform, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
    
    }
    
    
    


