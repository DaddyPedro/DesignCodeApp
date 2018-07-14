//
//  ChaptersViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/12/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    
    
    @IBOutlet weak var chapter1CollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapter1CollectionView.delegate = self
        chapter1CollectionView.dataSource = self
        scrollView.delegate = self
      
    }


}

extension ChaptersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chapter1CollectionView.dequeueReusableCell(withReuseIdentifier: "chapter1Cell", for: indexPath) as! SectionCollectionViewCell
        let section = sections[indexPath.row]
        cell.cellTitleLabel.text = section["title"]
        cell.cellCaptionLabel.text = section["caption"]
        cell.cellImageView.image = UIImage(named: section["image"]!)
        cell.layer.transform  = animateCell(cellFrame: cell.frame)
        
        return cell
        
    }
    

    
    
    
    
    
    
    
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





extension ChaptersViewController: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {


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
    
    
}
